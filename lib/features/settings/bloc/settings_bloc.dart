import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/key_manager/key_store.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final KeyStore _keyStore;

  SettingsBloc(this._keyStore) : super(const SettingsState()) {
    on<SettingsLoaded>(_onLoaded);
    on<ThemeChanged>(_onThemeChanged);
    on<MapSourcePreferenceChanged>(_onSourceChanged);
    on<TiandituKeyUpdated>(_onTiandituKey);
    on<MapboxTokenUpdated>(_onMapboxToken);
    on<LocationAccuracyPreferenceChanged>(_onAccuracyChanged);
  }

  Future<void> _onLoaded(SettingsLoaded event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final tdtKey = await _keyStore.getTiandituKey();
      final mbToken = await _keyStore.getMapboxToken();
      emit(state.copyWith(isLoading: false, tiandituKey: tdtKey, mapboxToken: mbToken));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void _onThemeChanged(ThemeChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isDarkTheme: event.isDark));
  }

  void _onSourceChanged(MapSourcePreferenceChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(preferredMapSource: event.preferredSource));
  }

  Future<void> _onTiandituKey(TiandituKeyUpdated event, Emitter<SettingsState> emit) async {
    await _keyStore.setTiandituKey(event.key);
    emit(state.copyWith(tiandituKey: event.key));
  }

  Future<void> _onMapboxToken(MapboxTokenUpdated event, Emitter<SettingsState> emit) async {
    await _keyStore.setMapboxToken(event.token);
    emit(state.copyWith(mapboxToken: event.token));
  }

  void _onAccuracyChanged(LocationAccuracyPreferenceChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(locationAccuracy: event.accuracy));
  }
}
