import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

abstract class AnnotationEvent extends Equatable {
  const AnnotationEvent();
  @override
  List<Object?> get props => [];
}

class AnnotationLoadRequested extends AnnotationEvent {
  final String? folderId;
  const AnnotationLoadRequested({this.folderId});
  @override
  List<Object?> get props => [folderId];
}

class PointCreated extends AnnotationEvent {
  final LatLng position;
  final String name;
  final String? description;
  final String folderId;
  const PointCreated(this.position, this.name, {this.description, this.folderId = ''});
  @override
  List<Object?> get props => [position, name, description, folderId];
}

class PolylineCreated extends AnnotationEvent {
  final List<LatLng> points;
  final String name;
  final String folderId;
  const PolylineCreated(this.points, this.name, {this.folderId = ''});
  @override
  List<Object?> get props => [points, name, folderId];
}

class PolygonCreated extends AnnotationEvent {
  final List<LatLng> points;
  final String name;
  final String folderId;
  const PolygonCreated(this.points, this.name, {this.folderId = ''});
  @override
  List<Object?> get props => [points, name, folderId];
}

class TextAnnotationCreated extends AnnotationEvent {
  final LatLng position;
  final String text;
  final String folderId;
  const TextAnnotationCreated(this.position, this.text, {this.folderId = ''});
  @override
  List<Object?> get props => [position, text, folderId];
}

class AnnotationDeleted extends AnnotationEvent {
  final String id;
  const AnnotationDeleted(this.id);
  @override
  List<Object?> get props => [id];
}

class AnnotationStyleUpdated extends AnnotationEvent {
  final String id;
  final Map<String, dynamic> style;
  const AnnotationStyleUpdated(this.id, this.style);
  @override
  List<Object?> get props => [id, style];
}

class MeasureModeToggled extends AnnotationEvent {
  final bool enabled;
  final String measureType; // 'distance' | 'area' | 'coordinate'
  const MeasureModeToggled(this.enabled, {this.measureType = 'distance'});
  @override
  List<Object?> get props => [enabled, measureType];
}

class MeasurePointAdded extends AnnotationEvent {
  final LatLng point;
  const MeasurePointAdded(this.point);
  @override
  List<Object?> get props => [point];
}

class MeasureCleared extends AnnotationEvent {}
