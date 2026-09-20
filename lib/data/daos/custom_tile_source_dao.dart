import 'package:drift/drift.dart';
import '../models/database.dart';

class CustomTileSourceDao {
  final AppDatabase _db;
  CustomTileSourceDao(this._db);

  Future<List<CustomTileSource>> getAllSources() => _db.select(_db.customTileSources).get();

  Future<List<CustomTileSource>> getActiveSources() {
    return (_db.select(_db.customTileSources)..where((s) => s.isActive.equals(true))).get();
  }

  Future<CustomTileSource?> getSourceById(String id) {
    return (_db.select(_db.customTileSources)..where((s) => s.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertSource(CustomTileSourcesCompanion companion) {
    return _db.into(_db.customTileSources).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateSource(CustomTileSourcesCompanion companion) {
    return _db.update(_db.customTileSources).replace(companion);
  }

  Future<int> deleteSource(String id) {
    return (_db.delete(_db.customTileSources)..where((s) => s.id.equals(id))).go();
  }

  Future<int> toggleActive(String id, bool active) {
    return (_db.update(_db.customTileSources)..where((s) => s.id.equals(id)))
        .write(CustomTileSourcesCompanion(isActive: Value(active)));
  }
}
