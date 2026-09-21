import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class MapState extends Equatable {
  final bool isReady;
  final LatLng center;
  final double zoom;
  final String activeBaseSource;
  final List<String> activeOverlays;
  final List<Map<String, dynamic>> customSources;
  final String? error;

  const MapState({
    this.isReady = false,
    this.center = const LatLng(39.9042, 116.4074),
    this.zoom = 10.0,
    this.activeBaseSource = 'osm',
    this.activeOverlays = const [],
    this.customSources = const [],
    this.error,
  });

  MapState copyWith({
    bool? isReady,
    LatLng? center,
    double? zoom,
    String? activeBaseSource,
    List<String>? activeOverlays,
    List<Map<String, dynamic>>? customSources,
    String? error,
  }) {
    return MapState(
      isReady: isReady ?? this.isReady,
      center: center ?? this.center,
      zoom: zoom ?? this.zoom,
      activeBaseSource: activeBaseSource ?? this.activeBaseSource,
      activeOverlays: activeOverlays ?? this.activeOverlays,
      customSources: customSources ?? this.customSources,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isReady, center, zoom, activeBaseSource, activeOverlays, customSources, error];
}
