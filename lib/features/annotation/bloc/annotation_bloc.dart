import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/database.dart';
import '../../../data/repositories/map_repository.dart';
import 'annotation_event.dart';
import 'annotation_state.dart';
import '../tools/measure_tool.dart';

class AnnotationBloc extends Bloc<AnnotationEvent, AnnotationState> {
  final MapRepository _repo;
  final _uuid = const Uuid();

  AnnotationBloc(this._repo) : super(const AnnotationState()) {
    on<AnnotationLoadRequested>(_onLoad);
    on<PointCreated>(_onPointCreated);
    on<PolylineCreated>(_onPolylineCreated);
    on<PolygonCreated>(_onPolygonCreated);
    on<TextAnnotationCreated>(_onTextCreated);
    on<AnnotationDeleted>(_onDeleted);
    on<AnnotationStyleUpdated>(_onStyleUpdated);
    on<MeasureModeToggled>(_onMeasureToggled);
    on<MeasurePointAdded>(_onMeasurePointAdded);
    on<MeasureCleared>(_onMeasureCleared);
  }

  Future<void> _onLoad(AnnotationLoadRequested event, Emitter<AnnotationState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final objs = event.folderId == null
          ? await _repo.mapObjectDao.getAllObjects()
          : await _repo.mapObjectDao.getObjectsByFolder(event.folderId!);
      emit(state.copyWith(isLoading: false, objects: objs));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onPointCreated(PointCreated event, Emitter<AnnotationState> emit) async {
    final id = _uuid.v4();
    await _repo.mapObjectDao.insertObject(MapObjectsCompanion.insert(
      id: id,
      folderId: event.folderId,
      type: MapObjectType.point,
      name: event.name,
      coordinateJson: jsonEncode({'lat': event.position.latitude, 'lng': event.position.longitude}),
      propertiesJson: Value(jsonEncode({'description': event.description ?? ''})),
    ));
    add(AnnotationLoadRequested(folderId: event.folderId.isEmpty ? null : event.folderId));
  }

  Future<void> _onPolylineCreated(PolylineCreated event, Emitter<AnnotationState> emit) async {
    final id = _uuid.v4();
    final coords = event.points.map((p) => {'lat': p.latitude, 'lng': p.longitude}).toList();
    await _repo.mapObjectDao.insertObject(MapObjectsCompanion.insert(
      id: id,
      folderId: event.folderId,
      type: MapObjectType.polyline,
      name: event.name,
      coordinateJson: jsonEncode(coords),
    ));
    add(AnnotationLoadRequested(folderId: event.folderId.isEmpty ? null : event.folderId));
  }

  Future<void> _onPolygonCreated(PolygonCreated event, Emitter<AnnotationState> emit) async {
    final id = _uuid.v4();
    final coords = event.points.map((p) => {'lat': p.latitude, 'lng': p.longitude}).toList();
    await _repo.mapObjectDao.insertObject(MapObjectsCompanion.insert(
      id: id,
      folderId: event.folderId,
      type: MapObjectType.polygon,
      name: event.name,
      coordinateJson: jsonEncode(coords),
    ));
    add(AnnotationLoadRequested(folderId: event.folderId.isEmpty ? null : event.folderId));
  }

  Future<void> _onTextCreated(TextAnnotationCreated event, Emitter<AnnotationState> emit) async {
    final id = _uuid.v4();
    await _repo.mapObjectDao.insertObject(MapObjectsCompanion.insert(
      id: id,
      folderId: event.folderId,
      type: MapObjectType.text,
      name: event.text,
      coordinateJson: jsonEncode({'lat': event.position.latitude, 'lng': event.position.longitude}),
    ));
    add(AnnotationLoadRequested(folderId: event.folderId.isEmpty ? null : event.folderId));
  }

  Future<void> _onDeleted(AnnotationDeleted event, Emitter<AnnotationState> emit) async {
    await _repo.mapObjectDao.deleteObject(event.id);
    add(const AnnotationLoadRequested());
  }

  Future<void> _onStyleUpdated(AnnotationStyleUpdated event, Emitter<AnnotationState> emit) async {
    final obj = await _repo.mapObjectDao.getObjectById(event.id);
    if (obj == null) return;
    await _repo.mapObjectDao.updateObject(MapObjectsCompanion(
      id: Value(obj.id),
      styleJson: Value(jsonEncode(event.style)),
      updatedAt: Value(DateTime.now()),
    ));
    add(const AnnotationLoadRequested());
  }

  void _onMeasureToggled(MeasureModeToggled event, Emitter<AnnotationState> emit) {
    emit(state.copyWith(
      measureMode: event.enabled,
      measureType: event.measureType,
      measurePoints: const [],
      measureResult: null,
    ));
  }

  void _onMeasurePointAdded(MeasurePointAdded event, Emitter<AnnotationState> emit) {
    final points = List<LatLng>.from(state.measurePoints)..add(event.point);
    double? result;
    if (state.measureType == 'distance' && points.length >= 2) {
      result = MeasureTool.calculateDistance(points);
    } else if (state.measureType == 'area' && points.length >= 3) {
      result = MeasureTool.calculateArea(points);
    }
    emit(state.copyWith(measurePoints: points, measureResult: result));
  }

  void _onMeasureCleared(MeasureCleared event, Emitter<AnnotationState> emit) {
    emit(state.copyWith(measurePoints: const [], measureResult: null));
  }
}
