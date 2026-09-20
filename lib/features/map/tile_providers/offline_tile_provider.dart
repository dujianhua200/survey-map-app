import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:path/path.dart' as p;

class OfflineTileProvider extends TileProvider {
  final String tilesBasePath;

  OfflineTileProvider({required this.tilesBasePath});

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final filePath = p.join(tilesBasePath, '${coordinates.z}', '${coordinates.x}', '${coordinates.y}.png');
    return FileImage(File(filePath));
  }
}

class OfflineTileLayer extends TileLayer {
  OfflineTileLayer({required String tilesBasePath, super.maxZoom = 18})
      : super(
          tileProvider: OfflineTileProvider(tilesBasePath: tilesBasePath),
        );
}
