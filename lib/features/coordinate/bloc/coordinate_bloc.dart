import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/coordinate/coordinate_converter.dart';
import '../../../core/coordinate/coordinate_system.dart';
import 'coordinate_event.dart';
import 'coordinate_state.dart';

class CoordinateBloc extends Bloc<CoordinateEvent, CoordinateState> {
  CoordinateBloc() : super(const CoordinateState()) {
    on<CoordinateConvertRequested>(_onConvert);
    on<CoordinatePicked>(_onPicked);
    on<CoordinateFormatChanged>(_onFormatChanged);
  }

  void _onConvert(CoordinateConvertRequested event, Emitter<CoordinateState> emit) {
    try {
      final results = <String, String>{};
      final wgs84 = _toWgs84(event.input, event.fromSystem);

      for (final sys in ['wgs84', 'gcj02', 'cgcs2000', 'utm']) {
        final converted = CoordinateConverter.convert(wgs84, CoordinateSystemType.wgs84, _parseType(sys));
        results[sys] = _format(converted, sys, state.format);
      }
      emit(state.copyWith(
        inputPosition: event.input,
        fromSystem: event.fromSystem,
        toSystem: event.toSystem,
        results: results,
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void _onPicked(CoordinatePicked event, Emitter<CoordinateState> emit) {
    emit(state.copyWith(inputPosition: event.position));
  }

  void _onFormatChanged(CoordinateFormatChanged event, Emitter<CoordinateState> emit) {
    emit(state.copyWith(format: event.format));
  }

  LatLng _toWgs84(LatLng input, String fromSystem) {
    final fromType = _parseType(fromSystem);
    if (fromType == CoordinateSystemType.wgs84) return input;
    return CoordinateConverter.convert(input, fromType, CoordinateSystemType.wgs84);
  }

  CoordinateSystemType _parseType(String name) {
    switch (name) {
      case 'gcj02': return CoordinateSystemType.gcj02;
      case 'cgcs2000': return CoordinateSystemType.cgcs2000;
      case 'utm': return CoordinateSystemType.utm;
      default: return CoordinateSystemType.wgs84;
    }
  }

  String _format(LatLng coord, String system, String format) {
    if (system == 'utm') {
      // UTM returns a string representation via coordinate_converter
      return 'E ${coord.longitude.toStringAsFixed(1)}  N ${coord.latitude.toStringAsFixed(1)} (zone inferred)';
    }
    if (format == 'dms') {
      return '${_toDms(coord.latitude)} ${_toDms(coord.longitude)}';
    }
    return '${coord.latitude.toStringAsFixed(6)}, ${coord.longitude.toStringAsFixed(6)}';
  }

  String _toDms(double decimal) {
    final d = decimal.truncate();
    final m = ((decimal - d).abs() * 60).truncate();
    final s = ((decimal - d).abs() * 60 - m) * 60;
    return '${d}°${m}\'${s.toStringAsFixed(2)}"';
  }
}
