import 'dart:convert';
import 'dart:io';
import 'package:latlong2/latlong.dart';
import '../../../data/models/database.dart';
import '../../../core/logger/app_logger.dart';

class KmlExporter {
  static Future<String> exportAnnotations(List<MapObject> objects, String outputPath) async {
    final buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<kml xmlns="http://www.opengis.net/kml/2.2">');
    buffer.writeln('  <Document>');
    buffer.writeln('    <name>Survey Map Export</name>');

    for (final obj in objects) {
      buffer.writeln('    <Placemark>');
      buffer.writeln('      <name>${_escapeXml(obj.name)}</name>');
      try {
        final decoded = jsonDecode(obj.coordinateJson);
        List<Map<String, dynamic>> coords = [];
        if (decoded is List) {
          coords = decoded.cast<Map<String, dynamic>>();
        } else if (decoded is Map) {
          coords = [decoded.cast<String, dynamic>()];
        }
        switch (obj.type) {
          case MapObjectType.point:
          case MapObjectType.text:
            if (coords.isNotEmpty) {
              final lat = (coords[0]['lat'] as num).toDouble();
              final lng = (coords[0]['lng'] as num).toDouble();
              buffer.writeln('      <Point><coordinates>$lng,$lat,0</coordinates></Point>');
            }
            break;
          case MapObjectType.polyline:
            if (coords.length >= 2) {
              buffer.writeln('      <LineString><coordinates>');
              for (final c in coords) {
                final lat = (c['lat'] as num).toDouble();
                final lng = (c['lng'] as num).toDouble();
                buffer.write(' $lng,$lat,0');
              }
              buffer.writeln('</coordinates></LineString>');
            }
            break;
          case MapObjectType.polygon:
            if (coords.length >= 3) {
              buffer.writeln('      <Polygon><outerBoundaryIs><LinearRing><coordinates>');
              for (final c in coords) {
                final lat = (c['lat'] as num).toDouble();
                final lng = (c['lng'] as num).toDouble();
                buffer.write(' $lng,$lat,0');
              }
              // Close the ring
              if (coords.isNotEmpty) {
                final first = coords.first;
                final lat = (first['lat'] as num).toDouble();
                final lng = (first['lng'] as num).toDouble();
                buffer.write(' $lng,$lat,0');
              }
              buffer.writeln('</coordinates></LinearRing></outerBoundaryIs></Polygon>');
            }
            break;
        }
      } catch (_) {
        buffer.writeln('      <Point><coordinates>0,0,0</coordinates></Point>');
      }
      buffer.writeln('    </Placemark>');
    }

    buffer.writeln('  </Document>');
    buffer.writeln('</kml>');

    final file = File(outputPath);
    await file.writeAsString(buffer.toString());
    AppLogger().i('KML exported to $outputPath');
    return outputPath;
  }

  static Future<String> exportTrack(Track track, List<TrackPoint> points, String outputPath) async {
    final buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<kml xmlns="http://www.opengis.net/kml/2.2">');
    buffer.writeln('  <Document>');
    buffer.writeln('    <name>${_escapeXml(track.name)}</name>');
    buffer.writeln('    <Placemark>');
    buffer.writeln('      <name>${_escapeXml(track.name)}</name>');
    buffer.writeln('      <LineString>');
    buffer.writeln('        <coordinates>');
    for (final p in points) {
      buffer.writeln('          ${p.longitude},${p.latitude},${p.elevation ?? 0}');
    }
    buffer.writeln('        </coordinates>');
    buffer.writeln('      </LineString>');
    buffer.writeln('    </Placemark>');
    buffer.writeln('  </Document>');
    buffer.writeln('</kml>');

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
