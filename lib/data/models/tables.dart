import 'package:drift/drift.dart';

@DataClassName('Folder')
class Folders extends Table {
  TextColumn get id => text()();
  TextColumn get parentId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get icon => text().nullable()();
  BoolColumn get isVisible => boolean().withDefault(const Constant(true))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column> get primaryKey => {id};
}

enum MapObjectType { point, polyline, polygon, text }

@DataClassName('MapObject')
class MapObjects extends Table {
  TextColumn get id => text()();
  TextColumn get folderId => text()();
  TextColumn get type => text().map(const MapObjectTypeConverter())();
  TextColumn get name => text()();
  TextColumn get styleJson => text().withDefault(const Constant('{}'))();
  TextColumn get coordinateJson => text()();
  TextColumn get propertiesJson => text().withDefault(const Constant('{}'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column> get primaryKey => {id};
}

class MapObjectTypeConverter extends TypeConverter<MapObjectType, String> {
  const MapObjectTypeConverter();
  @override
  MapObjectType fromSql(String fromDb) {
    return MapObjectType.values.firstWhere((e) => e.name == fromDb, orElse: () => MapObjectType.point);
  }
  @override
  String toSql(MapObjectType value) => value.name;
}

@DataClassName('Track')
class Tracks extends Table {
  TextColumn get id => text()();
  TextColumn get folderId => text()();
  TextColumn get name => text()();
  TextColumn get styleJson => text().withDefault(const Constant('{}'))();
  RealColumn get totalDistance => real().withDefault(const Constant(0.0))();
  RealColumn get maxElevation => real().nullable()();
  RealColumn get minElevation => real().nullable()();
  RealColumn get avgSpeed => real().nullable()();
  IntColumn get durationSec => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TrackPoint')
class TrackPoints extends Table {
  TextColumn get id => text()();
  TextColumn get trackId => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get elevation => real().nullable()();
  DateTimeColumn get timestamp => dateTime()();
  RealColumn get accuracy => real().nullable()();
  RealColumn get speed => real().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('OfflinePackage')
class OfflinePackages extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get sourceId => text()();
  RealColumn get minLat => real()();
  RealColumn get maxLat => real()();
  RealColumn get minLon => real()();
  RealColumn get maxLon => real()();
  IntColumn get minZoom => integer()();
  IntColumn get maxZoom => integer()();
  IntColumn get tileCount => integer().withDefault(const Constant(0))();
  TextColumn get filePath => text()();
  IntColumn get fileSize => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CustomTileSource')
class CustomTileSources extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get urlTemplate => text()();
  TextColumn get attribution => text().nullable()();
  TextColumn get subdomains => text().withDefault(const Constant('abc'))();
  IntColumn get maxZoom => integer().withDefault(const Constant(18))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AppSetting')
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column> get primaryKey => {key};
}
