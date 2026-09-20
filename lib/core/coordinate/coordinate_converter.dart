import 'package:latlong2/latlong.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;
import 'coordinate_system.dart';
import 'gcj02.dart';
import 'utm.dart';

class CoordinateConverter {
  static final Map<String, proj4.Projection> _projectionCache = {};

  static proj4.Projection _getOrCreateProjection(String epsgCode, String projString) {
    return _projectionCache.putIfAbsent(epsgCode, () => proj4.Projection.add(epsgCode, projString));
  }

  static LatLng convert(LatLng from, CoordinateSystemType fromType, CoordinateSystemType toType) {
    if (fromType == toType) return from;
    LatLng wgs84 = from;
    if (fromType == CoordinateSystemType.gcj02) {
      final result = Gcj02Converter.gcj02ToWgs84(from.latitude, from.longitude);
      wgs84 = LatLng(result[0], result[1]);
    }
    if (toType == CoordinateSystemType.wgs84) return wgs84;
    if (toType == CoordinateSystemType.gcj02) {
      final result = Gcj02Converter.wgs84ToGcj02(wgs84.latitude, wgs84.longitude);
      return LatLng(result[0], result[1]);
    }
    if (toType == CoordinateSystemType.cgcs2000) return wgs84;
    if (toType == CoordinateSystemType.utm) {
      final result = UtmConverter.wgs84ToUtm(wgs84.latitude, wgs84.longitude);
      return LatLng(result[1], result[0]);
    }
    return wgs84;
  }

  static String convertToUtmString(double lat, double lon) {
    final result = UtmConverter.wgs84ToUtm(lat, lon);
    final zone = result[2].toInt();
    final easting = result[0];
    final northing = result[1];
    final hemisphere = lat >= 0 ? 'N' : 'S';
    return 'Zone ${zone}${hemisphere} E: ${easting.toStringAsFixed(1)} N: ${northing.toStringAsFixed(1)}';
  }

  static String formatCoordinate(double lat, double lon, CoordinateFormat format) {
    switch (format) {
      case CoordinateFormat.decimalDegrees:
        return '${lat.toStringAsFixed(6)}°, ${lon.toStringAsFixed(6)}°';
      case CoordinateFormat.dms:
        return '${_toDMS(lat, true)} ${_toDMS(lon, false)}';
    }
  }

  static String _toDMS(double value, bool isLat) {
    final abs = value.abs();
    final deg = abs.floor();
    final min = ((abs - deg) * 60).floor();
    final sec = ((abs - deg) * 60 - min) * 60;
    final dir = isLat ? (value >= 0 ? 'N' : 'S') : (value >= 0 ? 'E' : 'W');
    return '$dir $deg° $min\' ${sec.toStringAsFixed(2)}"';
  }
}
