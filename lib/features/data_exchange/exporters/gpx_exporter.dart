import 'dart:convert';
import 'dart:io';
import 'package:latlong2/latlong.dart';
import '../../../data/models/database.dart';
import '../../../core/logger/app_logger.dart';

class GpxExporter {
  static Future<String> exportTrack(Track track, List<TrackPoint> points, String outputPath) async {
    final buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<gpx version="1.1" creator="SurveyMapApp" xmlns="http://www.topografix.com/GPX/1/1">');
    buffer.writeln('  <trk>');
    buffer.writeln('    <name>${_escapeXml(track.name)}</name>');
    buffer.writeln('    <trkseg>');
    for (final p in points) {
      buffer.write('      <trkpt lat="${p.latitude}" lon="${p.longitude}">');
      if (p.elevation != null) buffer.write('<ele>${p.elevation}</ele>');
      buffer.write('<time>${p.timestamp.toUtc().toIso8601String()}</time>');
      buffer.writeln('</trkpt>');
    }
    buffer.writeln('    </trkseg>');
    buffer.writeln('  </trk>');
    buffer.writeln('</gpx>');

    final file = File(outputPath);
    await file.writeAsString(buffer.toString());
    AppLogger().i('GPX exported to $outputPath');
    return outputPath;
  }

  static Future<String> exportWaypoints(List<MapObject> points, String outputPath) async {
    final buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<gpx version="1.1" creator="SurveyMapApp" xmlns="http://www.topografix.com/GPX/1/1">');
    for (final obj in points) {
      double lat = 0.0;
      double lon = 0.0;
      try {
        final decoded = jsonDecode(obj.coordinateJson);
        if (decoded is Map) {
          lat = (decoded['lat'] as num?)?.toDouble() ?? 0.0;
          lon = (decoded['lng'] as num?)?.toDouble() ?? 0.0;
        } else if (decoded is List && decoded.isNotEmpty) {
          lat = (decoded[0]['lat'] as num?)?.toDouble() ?? 0.0;
          lon = (decoded[0]['lng'] as num?)?.toDouble() ?? 0.0;
        }
      } catch (_) {}
      buffer.writeln('  <wpt lat="$lat" lon="$lon">');
      buffer.writeln('    <name>${_escapeXml(obj.name)}</name>');
      buffer.writeln('  </wpt>');
    }
    buffer.writeln('</gpx>');

    final file = File(outputPath);
    await file.writeAsString(buffer.toString());
    return outputPath;
  }

  static String _escapeXml(String text) {
    return text
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&apos;');
  }
}
