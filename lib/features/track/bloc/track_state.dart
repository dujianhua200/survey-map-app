import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import '../../../data/models/database.dart';

enum TrackRecordingStatus { idle, recording, paused }

class TrackState extends Equatable {
  final bool isLoading;
  final List<Track> tracks;
  final TrackRecordingStatus recordingStatus;
  final String? activeTrackId;
  final int pointCount;
  final double currentDistance;
  final List<LatLng> activeTrackPoints;
  final String? exportPath;
  final String? error;

  const TrackState({
    this.isLoading = false,
    this.tracks = const [],
    this.recordingStatus = TrackRecordingStatus.idle,
    this.activeTrackId,
    this.pointCount = 0,
    this.currentDistance = 0.0,
    this.activeTrackPoints = const [],
    this.exportPath,
    this.error,
  });

  TrackState copyWith({
    bool? isLoading,
    List<Track>? tracks,
    TrackRecordingStatus? recordingStatus,
    String? activeTrackId,
    int? pointCount,
    double? currentDistance,
    List<LatLng>? activeTrackPoints,
    String? exportPath,
    String? error,
  }) {
    return TrackState(
      isLoading: isLoading ?? this.isLoading,
      tracks: tracks ?? this.tracks,
      recordingStatus: recordingStatus ?? this.recordingStatus,
      activeTrackId: activeTrackId,
      pointCount: pointCount ?? this.pointCount,
      currentDistance: currentDistance ?? this.currentDistance,
      activeTrackPoints: activeTrackPoints ?? this.activeTrackPoints,
      exportPath: exportPath,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, tracks, recordingStatus, activeTrackId, pointCount, currentDistance, activeTrackPoints, exportPath, error];
}
