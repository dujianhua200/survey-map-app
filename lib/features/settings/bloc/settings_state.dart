import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool isLoading;
  final bool isDarkTheme;
  final String preferredMapSource;
  final String? tiandituKey;
  final String? mapboxToken;
  final String locationAccuracy;
  final String? error;

  const SettingsState({
    this.isLoading = false,
    this.isDarkTheme = false,
    this.preferredMapSource = 'tianditu_vec',
    this.tiandituKey,
    this.mapboxToken,
    this.locationAccuracy = 'high',
    this.error,
  });

  SettingsState copyWith({
    bool? isLoading,
    bool? isDarkTheme,
    String? preferredMapSource,
    String? tiandituKey,
    String? mapboxToken,
    String? locationAccuracy,
    String? error,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      preferredMapSource: preferredMapSource ?? this.preferredMapSource,
      tiandituKey: tiandituKey ?? this.tiandituKey,
      mapboxToken: mapboxToken ?? this.mapboxToken,
      locationAccuracy: locationAccuracy ?? this.locationAccuracy,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isDarkTheme, preferredMapSource, tiandituKey, mapboxToken, locationAccuracy, error];
}
