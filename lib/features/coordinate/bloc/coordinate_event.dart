import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

abstract class CoordinateEvent extends Equatable {
  const CoordinateEvent();
  @override
  List<Object?> get props => [];
}

class CoordinateConvertRequested extends CoordinateEvent {
  final LatLng input;
  final String fromSystem; // 'wgs84' | 'gcj02' | 'cgcs2000' | 'utm'
  final String toSystem;
  const CoordinateConvertRequested(this.input, this.fromSystem, this.toSystem);
  @override
  List<Object?> get props => [input, fromSystem, toSystem];
}

class CoordinatePicked extends CoordinateEvent {
  final LatLng position;
  const CoordinatePicked(this.position);
  @override
  List<Object?> get props => [position];
}

class CoordinateFormatChanged extends CoordinateEvent {
  final String format; // 'decimal' | 'dms'
  const CoordinateFormatChanged(this.format);
  @override
  List<Object?> get props => [format];
}
