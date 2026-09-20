class UnitUtils {
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

  static String formatSpeed(double mps) {
    final kmh = mps * 3.6;
    return '${kmh.toStringAsFixed(1)} km/h';
  }

  static String formatDuration(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    final s = seconds % 60;
    if (h > 0) return '${h}h ${m}m ${s}s';
    if (m > 0) return '${m}m ${s}s';
    return '${s}s';
  }
}
