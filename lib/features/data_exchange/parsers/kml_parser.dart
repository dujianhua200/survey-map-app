import 'package:latlong2/latlong.dart';
import 'package:xml/xml.dart';

class KmlPlacemark {
  final String name;
  final String? description;
  final List<LatLng> coordinates;
  final String geometryType; // 'Point' | 'LineString' | 'Polygon'
  KmlPlacemark(this.name, this.coordinates, {this.description, this.geometryType = 'Point'});
}

class KmlParseResult {
  final String? documentName;
  final List<KmlPlacemark> placemarks;
  KmlParseResult({this.documentName, this.placemarks = const []});
}

class KmlParser {
  static KmlParseResult parse(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final root = document.findElements('kml').firstOrNull;
    if (root == null) throw Exception('Invalid KML: no <kml> root');

    final doc = root.findAllElements('Document').firstOrNull;
    final docName = doc?.findElements('name').firstOrNull?.innerText;

    final placemarks = <KmlPlacemark>[];
    for (final placemark in root.findAllElements('Placemark')) {
      final name = placemark.findElements('name').firstOrNull?.innerText ?? 'Placemark';
      final desc = placemark.findElements('description').firstOrNull?.innerText;

      final point = placemark.findElements('Point').firstOrNull;
      if (point != null) {
        final coords = _parseCoordinates(point.findElements('coordinates').firstOrNull?.innerText ?? '');
        if (coords.isNotEmpty) {
          placemarks.add(KmlPlacemark(name, coords, description: desc, geometryType: 'Point'));
        }
        continue;
      }

      final line = placemark.findElements('LineString').firstOrNull;
      if (line != null) {
        final coords = _parseCoordinates(line.findElements('coordinates').firstOrNull?.innerText ?? '');
        placemarks.add(KmlPlacemark(name, coords, description: desc, geometryType: 'LineString'));
        continue;
      }

      final poly = placemark.findElements('Polygon').firstOrNull;
      if (poly != null) {
        final outer = poly.findAllElements('outerBoundaryIs').firstOrNull;
        final ring = outer?.findElements('LinearRing').firstOrNull;
        final coords = _parseCoordinates(ring?.findElements('coordinates').firstOrNull?.innerText ?? '');
        placemarks.add(KmlPlacemark(name, coords, description: desc, geometryType: 'Polygon'));
      }
    }

    return KmlParseResult(documentName: docName, placemarks: placemarks);
  }

  static List<LatLng> _parseCoordinates(String text) {
    final result = <LatLng>[];
    for (final part in text.split(RegExp(r'\s+'))) {
      final vals = part.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
      if (vals.length >= 2) {
        final lon = double.tryParse(vals[0]);
        final lat = double.tryParse(vals[1]);
        if (lat != null && lon != null) result.add(LatLng(lat, lon));
      }
    }
    return result;
  }
}
