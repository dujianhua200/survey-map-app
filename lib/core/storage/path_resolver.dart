import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class PathResolver {
  static final PathResolver _instance = PathResolver._internal();
  factory PathResolver() => _instance;
  PathResolver._internal();

  Future<void> init() async {
    await appDirectory;
    await cacheDirectory;
  }

  String? _appDir;
  String? _cacheDir;

  Future<String> get appDirectory async {
    _appDir ??= await _getAppDirectory();
    return _appDir!;
  }

  Future<String> get cacheDirectory async {
    _cacheDir ??= await _getCacheDirectory();
    return _cacheDir!;
  }

  Future<String> get tilesCacheDir async {
    final dir = p.join(await cacheDirectory, 'tiles');
    await Directory(dir).create(recursive: true);
    return dir;
  }

  Future<String> get offlinePackagesDir async {
    final dir = p.join(await appDirectory, 'offline_packages');
    await Directory(dir).create(recursive: true);
    return dir;
  }

  Future<String> get exportsDir async {
    final dir = p.join(await appDirectory, 'exports');
    await Directory(dir).create(recursive: true);
    return dir;
  }

  Future<String> _getAppDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final appDir = p.join(dir.path, 'SurveyMap');
    await Directory(appDir).create(recursive: true);
    return appDir;
  }

  Future<String> _getCacheDirectory() async {
    final dir = await getTemporaryDirectory();
    final cacheDir = p.join(dir.path, 'SurveyMap', 'Cache');
    await Directory(cacheDir).create(recursive: true);
    return cacheDir;
  }
}
