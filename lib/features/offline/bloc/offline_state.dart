import 'package:equatable/equatable.dart';
import '../../../data/models/database.dart';

enum OfflineDownloadStatus { idle, downloading, completed, error }

class OfflineState extends Equatable {
  final bool isLoading;
  final List<OfflinePackage> packages;
  final OfflineDownloadStatus downloadStatus;
  final int downloadedTiles;
  final int totalTiles;
  final String? currentPackageId;
  final String? error;

  const OfflineState({
    this.isLoading = false,
    this.packages = const [],
    this.downloadStatus = OfflineDownloadStatus.idle,
    this.downloadedTiles = 0,
    this.totalTiles = 0,
    this.currentPackageId,
    this.error,
  });

  OfflineState copyWith({
    bool? isLoading,
    List<OfflinePackage>? packages,
    OfflineDownloadStatus? downloadStatus,
    int? downloadedTiles,
    int? totalTiles,
    String? currentPackageId,
    String? error,
  }) {
    return OfflineState(
      isLoading: isLoading ?? this.isLoading,
      packages: packages ?? this.packages,
      downloadStatus: downloadStatus ?? this.downloadStatus,
      downloadedTiles: downloadedTiles ?? this.downloadedTiles,
      totalTiles: totalTiles ?? this.totalTiles,
      currentPackageId: currentPackageId,
      error: error,
    );
  }

  double get progress => totalTiles > 0 ? downloadedTiles / totalTiles : 0.0;

  @override
  List<Object?> get props => [isLoading, packages, downloadStatus, downloadedTiles, totalTiles, currentPackageId, error];
}
