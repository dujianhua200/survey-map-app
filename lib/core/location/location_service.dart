import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../platform/platform_utils.dart';
import '../logger/app_logger.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  StreamSubscription<Position>? _positionStream;
  final _positionController = StreamController<Position>.broadcast();
  final _logger = AppLogger();

  bool _isRecording = false;
  bool _isPaused = false;

  Stream<Position> get positionStream => _positionController.stream;
  bool get isRecording => _isRecording;
  bool get isPaused => _isPaused;

  Future<bool> checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }
    if (permission == LocationPermission.deniedForever) return false;
    return true;
  }

  Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await checkPermission();
      if (!hasPermission) return null;
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      _logger.e('获取当前位置失败', error: e);
      return null;
    }
  }

  Future<void> startTracking({int intervalSeconds = 5}) async {
    if (_isRecording) return;
    final hasPermission = await checkPermission();
    if (!hasPermission) throw Exception('定位权限未授予');
    _isRecording = true;
    _isPaused = false;
    final settings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 0,
    );
    _positionStream = Geolocator.getPositionStream(locationSettings: settings)
        .listen((position) {
      if (!_isPaused) _positionController.add(position);
    }, onError: (e) => _logger.e('位置流错误', error: e));
  }

  void pauseTracking() => _isPaused = true;
  void resumeTracking() { if (_isRecording) _isPaused = false; }

  Future<void> stopTracking() async {
    _isRecording = false;
    _isPaused = false;
    await _positionStream?.cancel();
    _positionStream = null;
  }

  Future<void> dispose() async {
    await stopTracking();
    await _positionController.close();
  }

  String get locationAccuracyNote {
    if (PlatformUtils.isDesktop) {
      return '当前设备未检测到 GPS，定位精度可能较低。如需高精度定位，请连接外置蓝牙 GPS 设备。';
    }
    return '';
  }
}
