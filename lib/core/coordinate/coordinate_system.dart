import 'package:latlong2/latlong.dart';

enum CoordinateSystemType {
  wgs84, gcj02, cgcs2000, beijing54, xian80, utm,
}

class CoordinateSystem {
  final CoordinateSystemType type;
  final String name;
  final String epsgCode;
  final String? description;

  const CoordinateSystem({
    required this.type, required this.name, required this.epsgCode, this.description,
  });

  static const List<CoordinateSystem> allSystems = [
    CoordinateSystem(type: CoordinateSystemType.wgs84, name: 'WGS-84', epsgCode: 'EPSG:4326', description: '世界大地坐标系 1984'),
    CoordinateSystem(type: CoordinateSystemType.gcj02, name: 'GCJ-02', epsgCode: 'EPSG:4490', description: '国测局坐标系（火星坐标系）'),
    CoordinateSystem(type: CoordinateSystemType.cgcs2000, name: 'CGCS2000', epsgCode: 'EPSG:4490', description: '中国 2000 国家大地坐标系'),
    CoordinateSystem(type: CoordinateSystemType.beijing54, name: '北京 54', epsgCode: 'EPSG:4214', description: '1954 年北京坐标系'),
    CoordinateSystem(type: CoordinateSystemType.xian80, name: '西安 80', epsgCode: 'EPSG:4610', description: '1980 年西安坐标系'),
    CoordinateSystem(type: CoordinateSystemType.utm, name: 'UTM', epsgCode: 'EPSG:326xx', description: '通用横轴墨卡托投影'),
  ];

  static CoordinateSystem? fromType(CoordinateSystemType t) {
    try { return allSystems.firstWhere((s) => s.type == t); } catch (_) { return null; }
  }
}

enum CoordinateFormat { decimalDegrees, dms }

class CoordinateValue {
  final double latitude;
  final double longitude;
  final CoordinateSystemType system;
  final double? elevation;

  const CoordinateValue({
    required this.latitude, required this.longitude, required this.system, this.elevation,
  });

  LatLng get latLng => LatLng(latitude, longitude);

  String format(CoordinateFormat format) {
    switch (format) {
      case CoordinateFormat.decimalDegrees:
        return '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';
      case CoordinateFormat.dms:
        return '${_toDMS(latitude, true)} ${_toDMS(longitude, false)}';
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
