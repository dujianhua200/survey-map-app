import 'dart:math';

class UtmConverter {
  static const double _a = 6378137.0;
  static const double _f = 1 / 298.257223563;
  static const double _e2 = 2 * _f - _f * _f;
  static const double _k0 = 0.9996;

  static List<double> wgs84ToUtm(double lat, double lon, {int? zone}) {
    final z = zone ?? ((lon + 180) / 6).floor() + 1;
    final lon0 = (z - 1) * 6 - 180 + 3;
    final radLat = lat * pi / 180;
    final radLon = (lon - lon0) * pi / 180;
    final N = _a / sqrt(1 - _e2 * sin(radLat) * sin(radLat));
    final T = tan(radLat) * tan(radLat);
    final C = _e2 * cos(radLat) * cos(radLat) / (1 - _e2);
    final A = cos(radLat) * radLon;
    final M = _a * ((1 - _e2 / 4 - 3 * _e2 * _e2 / 64 - 5 * _e2 * _e2 * _e2 / 256) * radLat -
        (3 * _e2 / 8 + 3 * _e2 * _e2 / 32 + 45 * _e2 * _e2 * _e2 / 1024) * sin(2 * radLat) +
        (15 * _e2 * _e2 / 256 + 45 * _e2 * _e2 * _e2 / 1024) * sin(4 * radLat) -
        (35 * _e2 * _e2 * _e2 / 3072) * sin(6 * radLat));
    final easting = _k0 * N * (A + (1 - T + C) * A * A * A / 6 +
        (5 - 18 * T + T * T + 72 * C - 58 * 0.006739496742276434) * pow(A, 5) / 120) + 500000;
    final northing = _k0 * (M + N * tan(radLat) * (A * A / 2 +
        (5 - T + 9 * C + 4 * C * C) * pow(A, 4) / 24 +
        (61 - 58 * T + T * T + 600 * C - 330 * 0.006739496742276434) * pow(A, 6) / 720));
    return [easting, lat >= 0 ? northing : northing + 10000000, z.toDouble()];
  }

  static List<double> utmToWgs84(double easting, double northing, int zone, bool isNorthern) {
    final x = easting - 500000;
    final y = isNorthern ? northing : northing - 10000000;
    final m = y / _k0;
    final mu = m / (_a * (1 - _e2 / 4 - 3 * _e2 * _e2 / 64 - 5 * _e2 * _e2 * _e2 / 256));
    final e1 = (1 - sqrt(1 - _e2)) / (1 + sqrt(1 - _e2));
    final j1 = (3 * e1 / 2 - 27 * e1 * e1 * e1 / 32);
    final j2 = (21 * e1 * e1 / 16 - 55 * e1 * e1 * e1 * e1 / 32);
    final j3 = (151 * e1 * e1 * e1 / 96);
    final j4 = (1097 * e1 * e1 * e1 * e1 / 512);
    final fp = mu + j1 * sin(2 * mu) + j2 * sin(4 * mu) + j3 * sin(6 * mu) + j4 * sin(8 * mu);
    final e2p = _e2 / (1 - _e2);
    final c1 = e2p * cos(fp) * cos(fp);
    final t1 = tan(fp) * tan(fp);
    final r1 = _a * (1 - _e2) / pow(1 - _e2 * sin(fp) * sin(fp), 1.5);
    final n1 = _a / sqrt(1 - _e2 * sin(fp) * sin(fp));
    final d = x / (n1 * _k0);
    final lat = fp - (n1 * tan(fp) / r1) * (d * d / 2 -
        (5 + 3 * t1 + 10 * c1 - 4 * c1 * c1 - 9 * e2p) * pow(d, 4) / 24 +
        (61 + 90 * t1 + 298 * c1 + 45 * t1 * t1 - 252 * e2p - 3 * c1 * c1) * pow(d, 6) / 720);
    final lon0 = (zone - 1) * 6 - 180 + 3;
    final lon = lon0 + (d - (1 + 2 * t1 + c1) * pow(d, 3) / 6 +
        (5 - 2 * c1 + 28 * t1 - 3 * c1 * c1 + 8 * e2p + 24 * t1 * t1) * pow(d, 5) / 120) / cos(fp);
    return [lat * 180 / pi, lon];
  }
}
