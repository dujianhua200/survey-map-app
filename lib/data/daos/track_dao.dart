import 'package:drift/drift.dart';
import '../models/database.dart';

class TrackDao {
  final AppDatabase _db;
  TrackDao(this._db);

  Future<List<Track>> getAllTracks() => _db.select(_db.tracks).get();

  Future<Track?> getTrackById(String id) {
    return (_db.select(_db.tracks)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<Track>> getTracksByFolder(String folderId) {
    return (_db.select(_db.tracks)..where((t) => t.folderId.equals(folderId))).get();
  }

  Future<int> insertTrack(TracksCompanion companion) {
    return _db.into(_db.tracks).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateTrack(TracksCompanion companion) {
    return _db.update(_db.tracks).replace(companion);
  }

  Future<int> deleteTrack(String id) {
    return (_db.delete(_db.tracks)..where((t) => t.id.equals(id))).go();
  }

  Future<int> deleteTracksByFolder(String folderId) {
    return (_db.delete(_db.tracks)..where((t) => t.folderId.equals(folderId))).go();
  }

  // Track points
  Future<List<TrackPoint>> getPointsByTrack(String trackId) {
    return (_db.select(_db.trackPoints)..where((p) => p.trackId.equals(trackId))
      ..orderBy([(p) => OrderingTerm(expression: p.timestamp)])).get();
  }

  Future<int> insertPoint(TrackPointsCompanion companion) {
    return _db.into(_db.trackPoints).insert(companion);
  }

  Future<int> deletePointsByTrack(String trackId) {
    return (_db.delete(_db.trackPoints)..where((p) => p.trackId.equals(trackId))).go();
  }

  Future<int> updateTrackStats(String trackId, {
    double? totalDistance,
    int? durationSec,
    double? maxElevation,
    double? minElevation,
    double? avgSpeed,
  }) {
    return (_db.update(_db.tracks)..where((t) => t.id.equals(trackId)))
        .write(TracksCompanion(
          totalDistance: totalDistance == null ? const Value.absent() : Value(totalDistance),
          durationSec: durationSec == null ? const Value.absent() : Value(durationSec),
          maxElevation: maxElevation == null ? const Value.absent() : Value(maxElevation),
          minElevation: minElevation == null ? const Value.absent() : Value(minElevation),
          avgSpeed: avgSpeed == null ? const Value.absent() : Value(avgSpeed),
          updatedAt: Value(DateTime.now()),
        ));
  }
}
