import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';

abstract class OfflineEvent extends Equatable {
  const OfflineEvent();
  @override
  List<Object?> get props => [];
}

class OfflinePackagesLoadRequested extends OfflineEvent {}

class OfflineDownloadStarted extends OfflineEvent {
  final String name;
  final LatLngBounds bounds;
  final int minZoom;
  final int maxZoom;
  final String sourceId;
  const OfflineDownloadStarted(this.name, this.bounds, this.minZoom, this.maxZoom, this.sourceId);
  @override
  List<Object?> get props => [name, bounds, minZoom, maxZoom, sourceId];
}

class OfflineDownloadProgressed extends OfflineEvent {
  final int downloaded;
  final int total;
  const OfflineDownloadProgressed(this.downloaded, this.total);
  @override
  List<Object?> get props => [downloaded, total];
}

class OfflineDownloadCompleted extends OfflineEvent {
  final String packageId;
  const OfflineDownloadCompleted(this.packageId);
  @override
  List<Object?> get props => [packageId];
}

class OfflinePackageDeleted extends OfflineEvent {
  final String packageId;
  const OfflinePackageDeleted(this.packageId);
  @override
  List<Object?> get props => [packageId];
}

class OfflineCancelRequested extends OfflineEvent {}
