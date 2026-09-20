import 'dart:io';
import 'package:flutter_map/flutter_map.dart';
import '../../../core/logger/app_logger.dart';
import '../../../core/key_manager/key_store.dart';

class TileDownloadService {
  final LatLngBounds bounds;
  final int minZoom;
  final int maxZoom;
  final String sourceId;
  final String outputPath;
  bool _cancelled = false;
  String? _tiandituKey;

  TileDownloadService({
    required this.bounds,
    required this.minZoom,
    required this.maxZoom,
    required this.sourceId,
    required this.outputPath,
  });

  int estimateTileCount() {
    int total = 0;
    for (int z = minZoom; z <= maxZoom; z++) {
      final minTile = _latLonToTile(bounds.southWest.latitude, bounds.southWest.longitude, z);
      final maxTile = _latLonToTile(bounds.northEast.latitude, bounds.northEast.longitude, z);
      final xCount = (maxTile.$1 - minTile.$1 + 1).abs();
      final yCount = (maxTile.$2 - minTile.$2 + 1).abs();
      total += xCount * yCount;
    }
    return total;
  }

  Future<void> download({required void Function(int downloaded) onProgress}) async {
    _cancelled = false;
    int downloaded = 0;
    final client = HttpClient();
    if (sourceId.startsWith('tianditu')) {
      _tiandituKey = await KeyStore().getTiandituKey();
    }
    try {
      for (int z = minZoom; z <= maxZoom; z++) {
        if (_cancelled) break;
        final minTile = _latLonToTile(bounds.southWest.latitude, bounds.southWest.longitude, z);
        final maxTile = _latLonToTile(bounds.northEast.latitude, bounds.northEast.longitude, z);
        final minX = minTile.$1 < maxTile.$1 ? minTile.$1 : maxTile.$1;
        final maxX = minTile.$1 < maxTile.$1 ? maxTile.$1 : minTile.$1;
        final minY = minTile.$2 < maxTile.$2 ? minTile.$2 : maxTile.$2;
        final maxY = minTile.$2 < maxTile.$2 ? maxTile.$2 : minTile.$2;

        for (int x = minX; x <= maxX; x++) {
          for (int y = minY; y <= maxY; y++) {
            if (_cancelled) break;
            final url = _buildUrl(x, y, z);
            try {
              final request = await client.getUrl(Uri.parse(url));
              final response = await request.close();
              if (response.statusCode == 200) {
                final bytes = await response.fold<List<int>>([], (p, e) => p..addAll(e));
                await _saveTile(z, x, y, bytes);
              }
            } catch (e) {
              AppLogger().w('Tile download failed: $url, error: $e');
            }
            downloaded++;
            onProgress(downloaded);
          }
        }
      }
    } finally {
      client.close();
    }
  }

  void cancel() => _cancelled = true;

  (int, int) _latLonToTile(double lat, double lon, int zoom) {
    final n = 1 << zoom;
    final x = ((lon + 180.0) / 360.0 * n).floor();
    final latRad = lat * 3.141592653589793 / 180.0;
    final y = ((1.0 - (latRad / 3.141592653589793 + 1.0) / 2.0) * n).floor();
    return (x.clamp(0, n - 1), y.clamp(0, n - 1));
  }

  String _buildUrl(int x, int y, int z) {
    // Real app routes to configured source
    if (sourceId.startsWith('custom_')) {
      // Use a placeholder template
      return 'https://tile.openstreetmap.org/$z/$x/$y.png';
    }
    final tk = _tiandituKey ?? 'YOUR_KEY';
    switch (sourceId) {
      case 'osm':
        return 'https://tile.openstreetmap.org/$z/$x/$y.png';
      case 'tianditu_vec':
        return 'https://t0.tianditu.gov.cn/vec_w/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=vec&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles&TILEMATRIX=$z&TILEROW=$y&TILECOL=$x&tk=$tk';
      case 'tianditu_img':
        return 'https://t0.tianditu.gov.cn/img_w/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=img&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles&TILEMATRIX=$z&TILEROW=$y&TILECOL=$x&tk=$tk';
      default:
        return 'https://tile.openstreetmap.org/$z/$x/$y.png';
    }
  }

  Future<void> _saveTile(int z, int x, int y, List<int> bytes) async {
    // Store into a folder structure under the package directory
    final tileDir = '$outputPath/tiles/$z/$x';
    await Directory(tileDir).create(recursive: true);
    final file = File('$tileDir/$y.png');
    await file.writeAsBytes(bytes);
  }
}
