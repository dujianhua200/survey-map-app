import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/storage/path_resolver.dart';
import 'core/logger/app_logger.dart';
import 'data/models/database.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  final pathResolver = PathResolver();
  await pathResolver.init();

  final database = AppDatabase();

  AppLogger().i('SurveyMapApp starting...');

  runApp(SurveyMapApp(database: database, pathResolver: pathResolver));
}
