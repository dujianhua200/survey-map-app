import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/key_manager/key_store.dart';

class TileSourceConfig {
  final String id;
  final String name;
  final String urlTemplate;
  final List<String> subdomains;
  final int maxZoom;
  final String attribution;
  final bool requiresKey;
  final String? keyPlaceholder;

  const TileSourceConfig({
    required this.id,
    required this.name,
    required this.urlTemplate,
    this.subdomains = const ['a', 'b', 'c'],
    this.maxZoom = 18,
    this.attribution = '',
    this.requiresKey = false,
    this.keyPlaceholder,
  });
}

class BuiltInTileSources {
  static const tiandituVec = TileSourceConfig(
    id: 'tianditu_vec',
    name: '天地图矢量',
    urlTemplate: 'https://{s}.tianditu.gov.cn/vec_w/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=vec&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}&tk={key}',
    subdomains: ['t0', 't1', 't2', 't3', 't4', 't5', 't6', 't7'],
    maxZoom: 18,
    attribution: '© 天地图',
    requiresKey: true,
    keyPlaceholder: 'TIANDITU_KEY',
  );

  static const tiandituImg = TileSourceConfig(
    id: 'tianditu_img',
    name: '天地图影像',
    urlTemplate: 'https://{s}.tianditu.gov.cn/img_w/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=img&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}&tk={key}',
    subdomains: ['t0', 't1', 't2', 't3', 't4', 't5', 't6', 't7'],
    maxZoom: 18,
    attribution: '© 天地图',
    requiresKey: true,
    keyPlaceholder: 'TIANDITU_KEY',
  );

  static const tiandituCva = TileSourceConfig(
    id: 'tianditu_cva',
    name: '天地图注记',
    urlTemplate: 'https://{s}.tianditu.gov.cn/cva_w/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=cva&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}&tk={key}',
    subdomains: ['t0', 't1', 't2', 't3', 't4', 't5', 't6', 't7'],
    maxZoom: 18,
    attribution: '© 天地图',
    requiresKey: true,
    keyPlaceholder: 'TIANDITU_KEY',
  );

  static const tiandituCia = TileSourceConfig(
    id: 'tianditu_cia',
    name: '天地图影像注记',
    urlTemplate: 'https://{s}.tianditu.gov.cn/cia_w/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=cia&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}&tk={key}',
    subdomains: ['t0', 't1', 't2', 't3', 't4', 't5', 't6', 't7'],
    maxZoom: 18,
    attribution: '© 天地图',
    requiresKey: true,
    keyPlaceholder: 'TIANDITU_KEY',
  );

  static const osm = TileSourceConfig(
    id: 'osm',
    name: 'OpenStreetMap',
    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    subdomains: ['a', 'b', 'c'],
    maxZoom: 19,
    attribution: '© OpenStreetMap contributors',
  );

  static const googleSat = TileSourceConfig(
    id: 'google_sat',
    name: '谷歌卫星 (需代理/合规)',
    urlTemplate: 'https://mt{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',
    subdomains: ['0', '1', '2', '3'],
    maxZoom: 20,
    attribution: '© Google',
  );

  static const mapbox = TileSourceConfig(
    id: 'mapbox',
    name: 'Mapbox (需Token)',
    urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={key}',
    subdomains: [],
    maxZoom: 18,
    attribution: '© Mapbox',
    requiresKey: true,
    keyPlaceholder: 'MAPBOX_TOKEN',
  );

  static const List<TileSourceConfig> all = [tiandituVec, tiandituImg, tiandituCva, osm, googleSat, mapbox];

  static TileSourceConfig? getById(String id) {
    try {
      return all.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}

Future<TileLayer> createTileLayer(TileSourceConfig config) async {
  String url = config.urlTemplate;
  if (config.requiresKey && config.keyPlaceholder != null) {
    String? key;
    if (config.keyPlaceholder == 'TIANDITU_KEY') {
      key = await KeyStore().getTiandituKey();
    } else if (config.keyPlaceholder == 'MAPBOX_TOKEN') {
      key = await KeyStore().getMapboxToken();
    }
    url = url.replaceAll('{key}', key ?? 'YOUR_KEY_HERE');
  }
  return TileLayer(
    urlTemplate: url,
    subdomains: config.subdomains,
    maxZoom: config.maxZoom.toDouble(),
    userAgentPackageName: 'com.surveymap.app',
  );
}
