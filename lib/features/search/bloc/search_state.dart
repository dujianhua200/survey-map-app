import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class SearchResultItem {
  final String id;
  final String name;
  final String? description;
  final LatLng position;
  final String type; // 'point' | 'track' | 'annotation'
  SearchResultItem({
    required this.id,
    required this.name,
    this.description,
    required this.position,
    required this.type,
  });
}

class SearchState extends Equatable {
  final bool isLoading;
  final List<SearchResultItem> results;
  final String? error;

  const SearchState({
    this.isLoading = false,
    this.results = const [],
    this.error,
  });

  SearchState copyWith({
    bool? isLoading,
    List<SearchResultItem>? results,
    String? error,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, results, error];
}
