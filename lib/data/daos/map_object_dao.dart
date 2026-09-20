import 'package:drift/drift.dart';
import '../models/database.dart';

class MapObjectDao {
  final AppDatabase _db;
  MapObjectDao(this._db);

  Future<List<MapObject>> getAllObjects() => _db.select(_db.mapObjects).get();

  Future<MapObject?> getObjectById(String id) {
    return (_db.select(_db.mapObjects)..where((o) => o.id.equals(id))).getSingleOrNull();
  }

  Future<List<MapObject>> getObjectsByFolder(String folderId) {
    return (_db.select(_db.mapObjects)..where((o) => o.folderId.equals(folderId))).get();
  }

  Future<List<MapObject>> getObjectsByType(String typeName) {
    return (_db.select(_db.mapObjects)..where((o) => o.type.equals(typeName))).get();
  }

  Future<int> insertObject(MapObjectsCompanion companion) {
    return _db.into(_db.mapObjects).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateObject(MapObjectsCompanion companion) {
    return _db.update(_db.mapObjects).replace(companion);
  }

  Future<int> deleteObject(String id) {
    return (_db.delete(_db.mapObjects)..where((o) => o.id.equals(id))).go();
  }

  Future<int> deleteObjectsByFolder(String folderId) {
    return (_db.delete(_db.mapObjects)..where((o) => o.folderId.equals(folderId))).go();
  }

  Future<int> moveToFolder(String objectId, String folderId) {
    return (_db.update(_db.mapObjects)..where((o) => o.id.equals(objectId)))
        .write(MapObjectsCompanion(folderId: Value(folderId), updatedAt: Value(DateTime.now())));
  }
}
