import 'package:equatable/equatable.dart';
import '../../../data/models/database.dart';

class FolderState extends Equatable {
  final bool isLoading;
  final List<Folder> folders;
  final String? selectedFolderId;
  final String? error;

  const FolderState({
    this.isLoading = false,
    this.folders = const [],
    this.selectedFolderId,
    this.error,
  });

  FolderState copyWith({
    bool? isLoading,
    List<Folder>? folders,
    String? selectedFolderId,
    String? error,
  }) {
    return FolderState(
      isLoading: isLoading ?? this.isLoading,
      folders: folders ?? this.folders,
      selectedFolderId: selectedFolderId,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, folders, selectedFolderId, error];
}
