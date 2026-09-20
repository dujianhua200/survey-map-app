import 'package:drift/drift.dart';
import '../models/database.dart';

class FolderDao {
  final AppDatabase _db;
  FolderDao(this._db);

  Future<List<Folder>> getAllFolders() => _db.select(_db.folders).get();

  Future<Folder?> getFolderById(String id) {
    return (_db.select(_db.folders)..where((f) => f.id.equals(id))).getSingleOrNull();
  }

  Future<List<Folder>> getFoldersByParent(String? parentId) {
    final query = _db.select(_db.folders);
    if (parentId == null || parentId.isEmpty) {
      query.where((f) => f.parentId.isNull() | f.parentId.equals(''));
    } else {
      query.where((f) => f.parentId.equals(parentId));
    }
    return query.get();
  }

  Future<int> insertFolder(FoldersCompanion companion) {
    return _db.into(_db.folders).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateFolder(FoldersCompanion companion) {
    return _db.update(_db.folders).replace(companion);
  }

  Future<int> deleteFolder(String id) {
    return (_db.delete(_db.folders)..where((f) => f.id.equals(id))).go();
  }

  Future<int> reorderFolder(String id, int newOrder) {
    return (_db.update(_db.folders)..where((f) => f.id.equals(id)))
        .write(FoldersCompanion(sortOrder: Value(newOrder)));
  }
}
