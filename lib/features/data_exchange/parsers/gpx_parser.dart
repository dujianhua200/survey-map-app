import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:xml/xml.dart';

class GpxWaypoint {
  final LatLng position;
  final String name;
  final String? description;
  final double? elevation;
  GpxWaypoint(this.position, this.name, {this.description, this.elevation});
}

class GpxTrack {
  final String name;
  final List<LatLng> points;
  GpxTrack(this.name, this.points);
}

class GpxParseResult {
  final List<GpxWaypoint> waypoints;
  final List<GpxTrack> tracks;
  GpxParseResult({this.waypoints = const [], this.tracks = const []});
}

class GpxParser {
  static GpxParseResult parse(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final root = document.findElements('gpx').firstOrNull;
    if (root == null) throw Exception('Invalid GPX: no <gpx> root');

    final waypoints = <GpxWaypoint>[];
    for (final wpt in root.findElements('wpt')) {
      final lat = double.tryParse(wpt.getAttribute('lat') ?? '');
      final lon = double.tryParse(wpt.getAttribute('lon') ?? '');
      if (lat == null || lon == null) continue;
      final name = wpt.findElements('name').firstOrNull?.innerText ?? 'Waypoint';
      final desc = wpt.findElements('desc').firstOrNull?.innerText;
      final ele = double.tryParse(wpt.findElements('ele').firstOrNull?.innerText ?? '');
      waypoints.add(GpxWaypoint(LatLng(lat, lon), name, description: desc, elevation: ele));
    }

    final tracks = <GpxTrack>[];
    for (final trk in root.findElements('trk')) {
      final name = trk.findElements('name').firstOrNull?.innerText ?? 'Track';
      final points = <LatLng>[];
      for (final trkseg in trk.findElements('trkseg')) {
        for (final trkpt in trkseg.findElements('trkpt')) {
          final lat = double.tryParse(trkpt.getAttribute('lat') ?? '');
          final lon = double.tryParse(trkpt.getAttribute('lon') ?? '');
          if (lat != null && lon != null) points.add(LatLng(lat, lon));
        }
      }
      tracks.add(GpxTrack(name, points));
    }

    return GpxParseResult(waypoints: waypoints, tracks: tracks);
  }
}
