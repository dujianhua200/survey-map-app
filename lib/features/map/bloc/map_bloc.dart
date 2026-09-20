import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../data/repositories/map_repository.dart';
import '../../../data/models/database.dart';
import 'map_event.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _repository;

  MapBloc(this._repository) : super(const MapState()) {
    on<MapInitialized>(_onInitialized);
    on<MapMoved>(_onMoved);
    on<TileSourceChanged>(_onSourceChanged);
    on<OverlayToggled>(_onOverlayToggled);
    on<MapZoomIn>(_onZoomIn);
    on<MapZoomOut>(_onZoomOut);
    on<MapCenterOnLocation>(_onCenterOnLocation);
    on<CustomSourceAdded>(_onCustomSourceAdded);
    on<CustomSourceRemoved>(_onCustomSourceRemoved);
  }

  Future<void> _onInitialized(MapInitialized event, Emitter<MapState> emit) async {
    final custom = await _repository.customTileSourceDao.getActiveSources();
    final customList = custom.map((s) => {
      'id': s.id,
      'name': s.name,
      'urlTemplate': s.urlTemplate,
      'subdomains': s.subdomains,
      'maxZoom': s.maxZoom,
    }).toList();
    emit(state.copyWith(isReady: true, customSources: customList));
  }

  void _onMoved(MapMoved event, Emitter<MapState> emit) {
    final c = event.camera.center;
    emit(state.copyWith(center: c, zoom: event.camera.zoom));
  }

  void _onSourceChanged(TileSourceChanged event, Emitter<MapState> emit) {
    emit(state.copyWith(activeBaseSource: event.sourceId));
  }

  void _onOverlayToggled(OverlayToggled event, Emitter<MapState> emit) {
    final overlays = List<String>.from(state.activeOverlays);
    if (event.visible) {
      if (!overlays.contains(event.overlayId)) overlays.add(event.overlayId);
    } else {
      overlays.remove(event.overlayId);
    }
    emit(state.copyWith(activeOverlays: overlays));
  }

  void _onZoomIn(MapZoomIn event, Emitter<MapState> emit) {
    emit(state.copyWith(zoom: (state.zoom + 1).clamp(1.0, 22.0)));
  }

  void _onZoomOut(MapZoomOut event, Emitter<MapState> emit) {
    emit(state.copyWith(zoom: (state.zoom - 1).clamp(1.0, 22.0)));
  }

  void _onCenterOnLocation(MapCenterOnLocation event, Emitter<MapState> emit) {
    emit(state.copyWith(center: event.location));
  }

  Future<void> _onCustomSourceAdded(CustomSourceAdded event, Emitter<MapState> emit) async {
    final id = const Uuid().v4();
    final source = CustomTileSourcesCompanion.insert(
      id: id,
      name: event.name,
      urlTemplate: event.urlTemplate,
      subdomains: Value(event.subdomains ?? 'abc'),
      maxZoom: const Value(18),
    );
    await _repository.customTileSourceDao.insertSource(source);

    final list = List<Map<String, dynamic>>.from(state.customSources);
    list.add({
      'id': id,
      'name': event.name,
      'urlTemplate': event.urlTemplate,
      'subdomains': event.subdomains ?? 'abc',
      'maxZoom': 18,
    });
    emit(state.copyWith(customSources: list));
  }

  Future<void> _onCustomSourceRemoved(CustomSourceRemoved event, Emitter<MapState> emit) async {
    final list = state.customSources.where((s) => s['id'] != event.sourceId).toList();
    emit(state.copyWith(customSources: list));
  }
}
