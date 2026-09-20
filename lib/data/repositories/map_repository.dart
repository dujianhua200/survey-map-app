import '../models/database.dart';
import '../daos/folder_dao.dart';
import '../daos/map_object_dao.dart';
import '../daos/track_dao.dart';
import '../daos/offline_package_dao.dart';
import '../daos/custom_tile_source_dao.dart';

class MapRepository {
  final AppDatabase _db;
  late final FolderDao folderDao;
  late final MapObjectDao mapObjectDao;
  late final TrackDao trackDao;
  late final OfflinePackageDao offlinePackageDao;
  late final CustomTileSourceDao customTileSourceDao;

  MapRepository(this._db) {
    folderDao = FolderDao(_db);
    mapObjectDao = MapObjectDao(_db);
    trackDao = TrackDao(_db);
    offlinePackageDao = OfflinePackageDao(_db);
    customTileSourceDao = CustomTileSourceDao(_db);
  }
}
