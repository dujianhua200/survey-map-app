import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class CoordinateState extends Equatable {
  final LatLng? inputPosition;
  final String fromSystem;
  final String toSystem;
  final String format;
  final Map<String, String> results; // system -> formatted string
  final String? error;

  const CoordinateState({
    this.inputPosition,
    this.fromSystem = 'wgs84',
    this.toSystem = 'gcj02',
    this.format = 'decimal',
    this.results = const {},
    this.error,
  });

  CoordinateState copyWith({
    LatLng? inputPosition,
    String? fromSystem,
    String? toSystem,
    String? format,
    Map<String, String>? results,
    String? error,
  }) {
    return CoordinateState(
      inputPosition: inputPosition ?? this.inputPosition,
      fromSystem: fromSystem ?? this.fromSystem,
      toSystem: toSystem ?? this.toSystem,
      format: format ?? this.format,
      results: results ?? this.results,
      error: error,
    );
  }

  @override
  List<Object?> get props => [inputPosition, fromSystem, toSystem, format, results, error];
}
