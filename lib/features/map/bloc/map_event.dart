import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
  @override
  List<Object?> get props => [];
}

class MapInitialized extends MapEvent {}

class MapMoved extends MapEvent {
  final MapCamera camera;
  const MapMoved(this.camera);
  @override
  List<Object?> get props => [camera];
}

class TileSourceChanged extends MapEvent {
  final String sourceId;
  const TileSourceChanged(this.sourceId);
  @override
  List<Object?> get props => [sourceId];
}

class OverlayToggled extends MapEvent {
  final String overlayId;
  final bool visible;
  const OverlayToggled(this.overlayId, this.visible);
  @override
  List<Object?> get props => [overlayId, visible];
}

class MapZoomIn extends MapEvent {}
class MapZoomOut extends MapEvent {}

class MapCenterOnLocation extends MapEvent {
  final LatLng location;
  const MapCenterOnLocation(this.location);
  @override
  List<Object?> get props => [location];
}

class CustomSourceAdded extends MapEvent {
  final String name;
  final String urlTemplate;
  final String? subdomains;
  const CustomSourceAdded(this.name, this.urlTemplate, {this.subdomains});
  @override
  List<Object?> get props => [name, urlTemplate, subdomains];
}

class CustomSourceRemoved extends MapEvent {
  final String sourceId;
  const CustomSourceRemoved(this.sourceId);
  @override
  List<Object?> get props => [sourceId];
}
