import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object?> get props => [];
}

class SettingsLoaded extends SettingsEvent {
  const SettingsLoaded();
}

class ThemeChanged extends SettingsEvent {
  final bool isDark;
  const ThemeChanged(this.isDark);
  @override
  List<Object?> get props => [isDark];
}

class MapSourcePreferenceChanged extends SettingsEvent {
  final String preferredSource;
  const MapSourcePreferenceChanged(this.preferredSource);
  @override
  List<Object?> get props => [preferredSource];
}

class TiandituKeyUpdated extends SettingsEvent {
  final String key;
  const TiandituKeyUpdated(this.key);
  @override
  List<Object?> get props => [key];
}

class MapboxTokenUpdated extends SettingsEvent {
  final String token;
  const MapboxTokenUpdated(this.token);
  @override
  List<Object?> get props => [token];
}

class LocationAccuracyPreferenceChanged extends SettingsEvent {
  final String accuracy; // 'high' | 'balanced' | 'low'
  const LocationAccuracyPreferenceChanged(this.accuracy);
  @override
  List<Object?> get props => [accuracy];
}
