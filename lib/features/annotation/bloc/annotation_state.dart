import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import '../../../data/models/database.dart';

class AnnotationState extends Equatable {
  final bool isLoading;
  final List<MapObject> objects;
  final bool measureMode;
  final String measureType;
  final List<LatLng> measurePoints;
  final double? measureResult;
  final String? error;

  const AnnotationState({
    this.isLoading = false,
    this.objects = const [],
    this.measureMode = false,
    this.measureType = 'distance',
    this.measurePoints = const [],
    this.measureResult,
    this.error,
  });

  AnnotationState copyWith({
    bool? isLoading,
    List<MapObject>? objects,
    bool? measureMode,
    String? measureType,
    List<LatLng>? measurePoints,
    double? measureResult,
    String? error,
  }) {
    return AnnotationState(
      isLoading: isLoading ?? this.isLoading,
      objects: objects ?? this.objects,
      measureMode: measureMode ?? this.measureMode,
      measureType: measureType ?? this.measureType,
      measurePoints: measurePoints ?? this.measurePoints,
      measureResult: measureResult,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, objects, measureMode, measureType, measurePoints, measureResult, error];
}
