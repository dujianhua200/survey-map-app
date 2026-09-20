import 'package:equatable/equatable.dart';

abstract class TrackEvent extends Equatable {
  const TrackEvent();
  @override
  List<Object?> get props => [];
}

class TrackLoadRequested extends TrackEvent {}

class TrackRecordingStarted extends TrackEvent {
  final String name;
  final String folderId;
  const TrackRecordingStarted(this.name, {this.folderId = ''});
  @override
  List<Object?> get props => [name, folderId];
}

class TrackRecordingPaused extends TrackEvent {}
class TrackRecordingResumed extends TrackEvent {}
class TrackRecordingStopped extends TrackEvent {}

class TrackLocationUpdated extends TrackEvent {
  final double lat;
  final double lng;
  final double? elevation;
  final double? accuracy;
  final double? speed;
  const TrackLocationUpdated(this.lat, this.lng, {this.elevation, this.accuracy, this.speed});
  @override
  List<Object?> get props => [lat, lng, elevation, accuracy, speed];
}

class TrackDeleted extends TrackEvent {
  final String trackId;
  const TrackDeleted(this.trackId);
  @override
  List<Object?> get props => [trackId];
}

class TrackExported extends TrackEvent {
  final String trackId;
  final String format; // 'gpx' | 'kml'
  const TrackExported(this.trackId, this.format);
  @override
  List<Object?> get props => [trackId, format];
}
