import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';
import '../../../data/models/database.dart';
import '../../../data/repositories/map_repository.dart';
import '../../../core/storage/path_resolver.dart';
import 'offline_event.dart';
import 'offline_state.dart';
import '../services/tile_download_service.dart';

class OfflineBloc extends Bloc<OfflineEvent, OfflineState> {
  final MapRepository _repo;
  final PathResolver _paths;
  final _uuid = const Uuid();
  TileDownloadService? _downloader;

  OfflineBloc(this._repo, this._paths) : super(const OfflineState()) {
    on<OfflinePackagesLoadRequested>(_onLoad);
    on<OfflineDownloadStarted>(_onDownloadStarted);
    on<OfflineDownloadProgressed>(_onProgressed);
    on<OfflineDownloadCompleted>(_onCompleted);
    on<OfflinePackageDeleted>(_onDeleted);
    on<OfflineCancelRequested>(_onCancel);
  }

  Future<void> _onLoad(OfflinePackagesLoadRequested event, Emitter<OfflineState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final pkgs = await _repo.offlinePackageDao.getAllPackages();
      emit(state.copyWith(isLoading: false, packages: pkgs));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onDownloadStarted(OfflineDownloadStarted event, Emitter<OfflineState> emit) async {
    final packageId = _uuid.v4();
    final fileName = packageId;
    final offlineDir = await _paths.offlinePackagesDir;
    final filePath = p.join(offlineDir, fileName);
    await Directory(filePath).create(recursive: true);

    await _repo.offlinePackageDao.insertPackage(OfflinePackagesCompanion.insert(
      id: packageId,
      name: event.name,
      sourceId: event.sourceId,
      minLat: event.bounds.southWest.latitude,
      maxLat: event.bounds.northEast.latitude,
      minLon: event.bounds.southWest.longitude,
      maxLon: event.bounds.northEast.longitude,
      minZoom: event.minZoom,
      maxZoom: event.maxZoom,
      filePath: filePath,
    ));

    emit(state.copyWith(
      downloadStatus: OfflineDownloadStatus.downloading,
      downloadedTiles: 0,
      totalTiles: 0,
      currentPackageId: packageId,
    ));

    _downloader = TileDownloadService(
      bounds: event.bounds,
      minZoom: event.minZoom,
      maxZoom: event.maxZoom,
      sourceId: event.sourceId,
      outputPath: filePath,
    );

    try {
      final total = _downloader!.estimateTileCount();
      emit(state.copyWith(totalTiles: total));
      await _downloader!.download(
        onProgress: (downloaded) {
          add(OfflineDownloadProgressed(downloaded, total));
        },
      );
      add(OfflineDownloadCompleted(packageId));
    } catch (e) {
      emit(state.copyWith(downloadStatus: OfflineDownloadStatus.error, error: e.toString()));
    }
  }

  void _onProgressed(OfflineDownloadProgressed event, Emitter<OfflineState> emit) {
    emit(state.copyWith(downloadedTiles: event.downloaded, totalTiles: event.total));
  }

  Future<void> _onCompleted(OfflineDownloadCompleted event, Emitter<OfflineState> emit) async {
    final pkgPath = (await _repo.offlinePackageDao.getPackageById(event.packageId))?.filePath ?? '';
    final dir = Directory(pkgPath);
    int size = 0;
    if (await dir.exists()) {
      try {
        await for (final entity in dir.list(recursive: true)) {
          if (entity is File) {
            size += await entity.length();
          }
        }
      } catch (_) {}
    }
    await _repo.offlinePackageDao.updateTileCount(event.packageId, state.downloadedTiles, size);
    emit(state.copyWith(downloadStatus: OfflineDownloadStatus.completed));
    add(OfflinePackagesLoadRequested());
  }

  Future<void> _onDeleted(OfflinePackageDeleted event, Emitter<OfflineState> emit) async {
    final pkg = await _repo.offlinePackageDao.getPackageById(event.packageId);
    if (pkg != null) {
      try {
        final d = Directory(pkg.filePath);
        if (await d.exists()) await d.delete(recursive: true);
      } catch (_) {}
      await _repo.offlinePackageDao.deletePackage(event.packageId);
    }
    add(OfflinePackagesLoadRequested());
  }

  void _onCancel(OfflineCancelRequested event, Emitter<OfflineState> emit) {
    _downloader?.cancel();
    emit(state.copyWith(downloadStatus: OfflineDownloadStatus.idle));
  }
}
