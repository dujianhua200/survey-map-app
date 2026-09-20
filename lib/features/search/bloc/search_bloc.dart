import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../../../data/repositories/map_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MapRepository _repo;

  SearchBloc(this._repo) : super(const SearchState()) {
    on<SearchQuerySubmitted>(_onSearch);
    on<SearchCleared>(_onCleared);
  }

  Future<void> _onSearch(SearchQuerySubmitted event, Emitter<SearchState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final q = event.query.toLowerCase();
      final results = <SearchResultItem>[];

      // Search annotations
      final objects = await _repo.mapObjectDao.getAllObjects();
      for (final obj in objects) {
        if (obj.name.toLowerCase().contains(q)) {
          LatLng pos;
          try {
            final c = jsonDecode(obj.coordinateJson);
            if (c is List) {
              pos = LatLng(c[0]['lat'] as double, c[0]['lng'] as double);
            } else {
              pos = LatLng(c['lat'] as double, c['lng'] as double);
            }
          } catch (_) {
            pos = const LatLng(0, 0);
          }
          results.add(SearchResultItem(
            id: obj.id,
            name: obj.name,
            position: pos,
            type: 'annotation',
          ));
        }
      }

      // Search tracks
      final tracks = await _repo.trackDao.getAllTracks();
      for (final t in tracks) {
        if (t.name.toLowerCase().contains(q)) {
          results.add(SearchResultItem(
            id: t.id,
            name: t.name,
            position: const LatLng(0, 0), // Could load first point
            type: 'track',
          ));
        }
      }

      emit(state.copyWith(isLoading: false, results: results));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void _onCleared(SearchCleared event, Emitter<SearchState> emit) {
    emit(const SearchState());
  }
}
