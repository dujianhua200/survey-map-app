import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/database.dart';
import '../../../data/repositories/map_repository.dart';
import '../../../core/location/location_service.dart';
import '../../annotation/tools/measure_tool.dart';
import 'track_event.dart';
import 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  final MapRepository _repo;
  final LocationService _location;
  final _uuid = const Uuid();
  final List<LatLng> _currentPoints = [];

  TrackBloc(this._repo, this._location) : super(const TrackState()) {
    on<TrackLoadRequested>(_onLoad);
    on<TrackRecordingStarted>(_onStarted);
    on<TrackRecordingPaused>(_onPaused);
    on<TrackRecordingResumed>(_onResumed);
    on<TrackRecordingStopped>(_onStopped);
    on<TrackLocationUpdated>(_onLocationUpdated);
    on<TrackDeleted>(_onDeleted);
    on<TrackExported>(_onExported);
  }

  Future<void> _onLoad(TrackLoadRequested event, Emitter<TrackState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final tracks = await _repo.trackDao.getAllTracks();
      emit(state.copyWith(isLoading: false, tracks: tracks));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onStarted(TrackRecordingStarted event, Emitter<TrackState> emit) async {
    final id = _uuid.v4();
    await _repo.trackDao.insertTrack(TracksCompanion.insert(
      id: id,
      folderId: event.folderId,
      name: event.name,
    ));
    _currentPoints.clear();
    _location.startTracking();
    emit(state.copyWith(
      recordingStatus: TrackRecordingStatus.recording,
      activeTrackId: id,
      pointCount: 0,
      currentDistance: 0.0,
      activeTrackPoints: const [],
    ));
  }

  void _onPaused(TrackRecordingPaused event, Emitter<TrackState> emit) {
    _location.pauseTracking();
    emit(state.copyWith(recordingStatus: TrackRecordingStatus.paused));
  }

  void _onResumed(TrackRecordingResumed event, Emitter<TrackState> emit) {
    _location.resumeTracking();
    emit(state.copyWith(recordingStatus: TrackRecordingStatus.recording));
  }

  Future<void> _onStopped(TrackRecordingStopped event, Emitter<TrackState> emit) async {
    _location.stopTracking();
    final trackId = state.activeTrackId;
    if (trackId != null && _currentPoints.isNotEmpty) {
      final distance = MeasureTool.calculateDistance(_currentPoints);
      await _repo.trackDao.updateTrackStats(
        trackId,
        totalDistance: distance,
        durationSec: 0, // TODO: compute elapsed
      );
    }
    _currentPoints.clear();
    emit(state.copyWith(
      recordingStatus: TrackRecordingStatus.idle,
      activeTrackId: null,
      pointCount: 0,
      currentDistance: 0.0,
      activeTrackPoints: const [],
    ));
    add(TrackLoadRequested());
  }

  Future<void> _onLocationUpdated(TrackLocationUpdated event, Emitter<TrackState> emit) async {
    final trackId = state.activeTrackId;
    if (trackId == null) return;
    final point = LatLng(event.lat, event.lng);
    _currentPoints.add(point);
    await _repo.trackDao.insertPoint(TrackPointsCompanion.insert(
      id: _uuid.v4(),
      trackId: trackId,
      latitude: event.lat,
      longitude: event.lng,
      elevation: event.elevation == null ? const Value.absent() : Value(event.elevation!),
      accuracy: event.accuracy == null ? const Value.absent() : Value(event.accuracy!),
      speed: event.speed == null ? const Value.absent() : Value(event.speed!),
      timestamp: DateTime.now(),
    ));
    final distance = MeasureTool.calculateDistance(_currentPoints);
    emit(state.copyWith(pointCount: _currentPoints.length, currentDistance: distance, activeTrackPoints: List<LatLng>.from(_currentPoints)));
  }

  Future<void> _onDeleted(TrackDeleted event, Emitter<TrackState> emit) async {
    await _repo.trackDao.deletePointsByTrack(event.trackId);
    await _repo.trackDao.deleteTrack(event.trackId);
    add(TrackLoadRequested());
  }

  Future<void> _onExported(TrackExported event, Emitter<TrackState> emit) async {
    // Placeholder: actual export delegates to GPX/KML exporter
    emit(state.copyWith(exportPath: 'pending'));
  }
}
