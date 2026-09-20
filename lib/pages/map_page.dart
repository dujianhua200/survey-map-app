import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../features/map/bloc/map_bloc.dart';
import '../features/map/bloc/map_event.dart';
import '../features/map/bloc/map_state.dart';
import '../features/map/tile_providers/tile_source_config.dart';
import '../features/annotation/bloc/annotation_bloc.dart';
import '../features/annotation/bloc/annotation_event.dart';
import '../features/annotation/bloc/annotation_state.dart';
import '../features/annotation/tools/measure_tool.dart';
import '../features/track/bloc/track_bloc.dart';
import '../features/track/bloc/track_event.dart';
import '../features/track/bloc/track_state.dart';
import '../core/location/location_service.dart';
import '../data/models/database.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    context.read<MapBloc>().add(MapInitialized());
    context.read<AnnotationBloc>().add(AnnotationLoadRequested());
    context.read<TrackBloc>().add(TrackLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMap(),
          _buildLayerSwitcher(),
          _buildMeasureOverlay(),
          _buildTrackOverlay(),
          _buildZoomControls(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'locate',
            onPressed: _locateMe,
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'menu',
            onPressed: _openMenu,
            child: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return BlocListener<MapBloc, MapState>(
      listener: (context, state) {
        if (state.zoom != _mapController.camera.zoom || state.center != _mapController.camera.center) {
          _mapController.move(state.center, state.zoom);
        }
      },
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, mapState) {
          return FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: mapState.center,
              initialZoom: mapState.zoom,
              onMapEvent: (event) {
                if (event is MapEventMove || event is MapEventMoveEnd) {
                  context.read<MapBloc>().add(MapMoved(_mapController.camera));
                }
              },
              onTap: (tapPosition, point) {
                final annBloc = context.read<AnnotationBloc>();
                if (annBloc.state.measureMode) {
                  annBloc.add(MeasurePointAdded(point));
                }
              },
            ),
            children: [
              _buildBaseLayer(mapState.activeBaseSource),
              ..._buildOverlays(mapState.activeOverlays),
              _buildAnnotationLayer(),
              _buildTrackLayer(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBaseLayer(String sourceId) {
    final config = BuiltInTileSources.getById(sourceId) ?? BuiltInTileSources.osm;
    return FutureBuilder<TileLayer>(
      future: createTileLayer(config),
      builder: (context, snapshot) {
        if (snapshot.hasData) return snapshot.data!;
        return TileLayer(urlTemplate: BuiltInTileSources.osm.urlTemplate);
      },
    );
  }

  List<Widget> _buildOverlays(List<String> overlayIds) {
    return overlayIds.map((id) {
      final config = BuiltInTileSources.getById(id);
      if (config == null) return const SizedBox.shrink();
      return FutureBuilder<TileLayer>(
        future: createTileLayer(config),
        builder: (context, snapshot) {
          if (snapshot.hasData) return snapshot.data!;
          return const SizedBox.shrink();
        },
      );
    }).toList();
  }

  Widget _buildAnnotationLayer() {
    return BlocBuilder<AnnotationBloc, AnnotationState>(
      builder: (context, state) {
        final markers = <Marker>[];
        final polylines = <Polyline>[];
        final polygons = <Polygon>[];

        for (final obj in state.objects) {
          switch (obj.type) {
            case MapObjectType.point:
              try {
                final c = _parseFirstCoord(obj.coordinateJson);
                markers.add(Marker(
                  point: c,
                  width: 40,
                  height: 40,
                  child: Icon(Icons.location_pin, color: Colors.red[700]),
                ));
              } catch (_) {}
              break;
            case MapObjectType.polyline:
              try {
                final pts = _parseCoords(obj.coordinateJson);
                if (pts.length >= 2) {
                  polylines.add(Polyline(
                    points: pts,
                    color: Colors.blue,
                    strokeWidth: 3.0,
                  ));
                }
              } catch (_) {}
              break;
            case MapObjectType.polygon:
              try {
                final pts = _parseCoords(obj.coordinateJson);
                if (pts.length >= 3) {
                  polygons.add(Polygon(
                    points: pts,
                    color: Colors.green.withOpacity(0.3),
                    borderColor: Colors.green,
                    borderStrokeWidth: 2.0,
                  ));
                }
              } catch (_) {}
              break;
            case MapObjectType.text:
              try {
                final c = _parseFirstCoord(obj.coordinateJson);
                markers.add(Marker(
                  point: c,
                  width: 120,
                  height: 40,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(obj.name, style: const TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                ));
              } catch (_) {}
              break;
          }
        }

        return Stack(
          children: [
            if (polylines.isNotEmpty) PolylineLayer(polylines: polylines),
            if (polygons.isNotEmpty) PolygonLayer(polygons: polygons),
            if (markers.isNotEmpty) MarkerLayer(markers: markers),
          ],
        );
      },
    );
  }

  Widget _buildTrackLayer() {
    return BlocBuilder<TrackBloc, TrackState>(
      builder: (context, state) {
        if (state.activeTrackPoints.length < 2) {
          return const SizedBox.shrink();
        }
        return PolylineLayer(
          polylines: [
            Polyline(
              points: state.activeTrackPoints,
              color: Colors.orange,
              strokeWidth: 4.0,
            ),
          ],
        );
      },
    );
  }

  Widget _buildLayerSwitcher() {
    return Positioned(
      top: 48,
      right: 16,
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: PopupMenuButton<String>(
              initialValue: state.activeBaseSource,
              onSelected: (id) => context.read<MapBloc>().add(TileSourceChanged(id)),
              itemBuilder: (context) => BuiltInTileSources.all
                  .map((s) => PopupMenuItem(value: s.id, child: Text(s.name)))
                  .toList(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.layers),
                    const SizedBox(width: 4),
                    Text(BuiltInTileSources.getById(state.activeBaseSource)?.name ?? '图层'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMeasureOverlay() {
    return BlocBuilder<AnnotationBloc, AnnotationState>(
      builder: (context, state) {
        if (!state.measureMode) return const SizedBox.shrink();
        return Positioned(
          bottom: 120,
          left: 16,
          right: 80,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('测量模式: ${state.measureType == 'distance' ? '距离' : '面积'}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('点数: ${state.measurePoints.length}'),
                if (state.measureResult != null)
                  Text('结果: ${state.measureType == 'distance' ? MeasureTool.formatDistance(state.measureResult!) : MeasureTool.formatArea(state.measureResult!)}'),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => context.read<AnnotationBloc>().add(MeasureCleared()),
                      child: const Text('清除'),
                    ),
                    TextButton(
                      onPressed: () => context.read<AnnotationBloc>().add(MeasureModeToggled(false, measureType: state.measureType)),
                      child: const Text('退出'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTrackOverlay() {
    return BlocBuilder<TrackBloc, TrackState>(
      builder: (context, state) {
        if (state.recordingStatus == TrackRecordingStatus.idle) return const SizedBox.shrink();
        return Positioned(
          top: 48,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.recordingStatus == TrackRecordingStatus.recording ? '● 记录中' : '⏸ 已暂停'),
                Text('点数: ${state.pointCount}'),
                Text('距离: ${MeasureTool.formatDistance(state.currentDistance)}'),
                Row(
                  children: [
                    if (state.recordingStatus == TrackRecordingStatus.recording)
                      IconButton(onPressed: () => context.read<TrackBloc>().add(TrackRecordingPaused()), icon: const Icon(Icons.pause))
                    else
                      IconButton(onPressed: () => context.read<TrackBloc>().add(TrackRecordingResumed()), icon: const Icon(Icons.play_arrow)),
                    IconButton(onPressed: () => context.read<TrackBloc>().add(TrackRecordingStopped()), icon: const Icon(Icons.stop)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildZoomControls() {
    return Positioned(
      bottom: 120,
      right: 16,
      child: Column(
        children: [
          FloatingActionButton.small(
            heroTag: 'zoomIn',
            onPressed: () => context.read<MapBloc>().add(MapZoomIn()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 4),
          FloatingActionButton.small(
            heroTag: 'zoomOut',
            onPressed: () => context.read<MapBloc>().add(MapZoomOut()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  void _locateMe() async {
    final pos = await LocationService().getCurrentPosition();
    if (pos != null) {
      final loc = LatLng(pos.latitude, pos.longitude);
      if (mounted) {
        context.read<MapBloc>().add(MapCenterOnLocation(loc));
      }
    }
  }

  void _openMenu() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: const Icon(Icons.folder), title: const Text('文件夹'), onTap: () { Navigator.pop(ctx); Navigator.pushNamed(context, '/folders'); }),
            ListTile(leading: const Icon(Icons.map), title: const Text('离线地图'), onTap: () { Navigator.pop(ctx); Navigator.pushNamed(context, '/offline'); }),
            ListTile(leading: const Icon(Icons.transform), title: const Text('坐标转换'), onTap: () { Navigator.pop(ctx); Navigator.pushNamed(context, '/coordinate'); }),
            ListTile(leading: const Icon(Icons.settings), title: const Text('设置'), onTap: () { Navigator.pop(ctx); Navigator.pushNamed(context, '/settings'); }),
            ListTile(leading: const Icon(Icons.straighten), title: const Text('距离测量'), onTap: () {
              Navigator.pop(ctx);
              context.read<AnnotationBloc>().add(const MeasureModeToggled(true, measureType: 'distance'));
            }),
            ListTile(leading: const Icon(Icons.square_foot), title: const Text('面积测量'), onTap: () {
              Navigator.pop(ctx);
              context.read<AnnotationBloc>().add(const MeasureModeToggled(true, measureType: 'area'));
            }),
            ListTile(leading: const Icon(Icons.route), title: const Text('开始记录轨迹'), onTap: () {
              Navigator.pop(ctx);
              _showTrackNameDialog();
            }),
          ],
        ),
      ),
    );
  }

  void _showTrackNameDialog() {
    final controller = TextEditingController(text: '轨迹 ${DateTime.now().toIso8601String().substring(0, 16)}');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('轨迹名称'),
        content: TextField(controller: controller, decoration: const InputDecoration(hintText: '输入轨迹名称')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('取消')),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<TrackBloc>().add(TrackRecordingStarted(controller.text));
            },
            child: const Text('开始'),
          ),
        ],
      ),
    );
  }

  List<LatLng> _parseCoords(String json) {
    final decoded = jsonDecode(json);
    if (decoded is List) {
      return decoded.map((c) => LatLng((c['lat'] as num).toDouble(), (c['lng'] as num).toDouble())).toList();
    } else if (decoded is Map) {
      return [LatLng((decoded['lat'] as num).toDouble(), (decoded['lng'] as num).toDouble())];
    }
    return [];
  }

  LatLng _parseFirstCoord(String json) {
    final coords = _parseCoords(json);
    if (coords.isNotEmpty) return coords.first;
    return const LatLng(0, 0);
  }
}
