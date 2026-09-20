import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

export 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Folders, MapObjects, Tracks, TrackPoints, OfflinePackages, CustomTileSources, AppSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async { await m.createAll(); },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'survey_map',
      native: const DriftNativeOptions(databasePath: getDatabasePath),
    );
  }
}

Future<String> getDatabasePath() async {
  final dir = await getApplicationDocumentsDirectory();
  final dbDir = p.join(dir.path, 'SurveyMap');
  await Directory(dbDir).create(recursive: true);
  return p.join(dbDir, 'survey_map.db');
}
