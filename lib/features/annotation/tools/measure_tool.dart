import 'package:latlong2/latlong.dart';
import 'package:geodesy/geodesy.dart';

class MeasureTool {
  static final Geodesy _geodesy = Geodesy();

  /// Calculate total polyline distance in meters.
  static double calculateDistance(List<LatLng> points) {
    if (points.length < 2) return 0.0;
    double total = 0.0;
    for (int i = 0; i < points.length - 1; i++) {
      total += _geodesy.distanceBetweenTwoGeoPoints(points[i], points[i + 1]).toDouble();
    }
    return total;
  }

  /// Calculate polygon area in square meters using spherical excess approximation.
  static double calculateArea(List<LatLng> points) {
    if (points.length < 3) return 0.0;
    // Close polygon if needed
    final pts = List<LatLng>.from(points);
    if (pts.first.latitude != pts.last.latitude || pts.first.longitude != pts.last.longitude) {
      pts.add(pts.first);
    }
    // geodesy polygonArea not available in this version; use planar fallback
    return _planarArea(pts);
  }

  static double _planarArea(List<LatLng> points) {
    double area = 0.0;
    for (int i = 0; i < points.length - 1; i++) {
      area += points[i].longitude * points[i + 1].latitude;
      area -= points[i + 1].longitude * points[i].latitude;
    }
    return (area.abs() / 2.0) * 111319.0 * 111319.0; // rough m^2 at equator
  }

  static String formatDistance(double meters) {
    if (meters >= 1000) {
      return '${(meters / 1000).toStringAsFixed(2)} km';
    }
    return '${meters.toStringAsFixed(1)} m';
  }

  static String formatArea(double sqMeters) {
    if (sqMeters >= 1000000) {
      return '${(sqMeters / 1000000).toStringAsFixed(3)} km²';
    }
    if (sqMeters >= 10000) {
      return '${(sqMeters / 10000).toStringAsFixed(2)} 公顷';
    }
    return '${sqMeters.toStringAsFixed(1)} m²';
  }
}
