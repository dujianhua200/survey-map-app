import 'package:drift/drift.dart';
import '../models/database.dart';

class OfflinePackageDao {
  final AppDatabase _db;
  OfflinePackageDao(this._db);

  Future<List<OfflinePackage>> getAllPackages() => _db.select(_db.offlinePackages).get();

  Future<OfflinePackage?> getPackageById(String id) {
    return (_db.select(_db.offlinePackages)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertPackage(OfflinePackagesCompanion companion) {
    return _db.into(_db.offlinePackages).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updatePackage(OfflinePackagesCompanion companion) {
    return _db.update(_db.offlinePackages).replace(companion);
  }

  Future<int> deletePackage(String id) {
    return (_db.delete(_db.offlinePackages)..where((p) => p.id.equals(id))).go();
  }

  Future<int> updateTileCount(String id, int tileCount, int fileSize) {
    return (_db.update(_db.offlinePackages)..where((p) => p.id.equals(id)))
        .write(OfflinePackagesCompanion(
          tileCount: Value(tileCount),
          fileSize: Value(fileSize),
        ));
  }
}
