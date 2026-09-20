import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/database.dart';
import '../../../data/repositories/map_repository.dart';
import 'folder_event.dart';
import 'folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  final MapRepository _repo;
  final _uuid = const Uuid();

  FolderBloc(this._repo) : super(const FolderState()) {
    on<FolderLoadRequested>(_onLoad);
    on<FolderCreated>(_onCreated);
    on<FolderRenamed>(_onRenamed);
    on<FolderDeleted>(_onDeleted);
    on<FolderVisibilityToggled>(_onVisibilityToggled);
  }

  Future<void> _onLoad(FolderLoadRequested event, Emitter<FolderState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final folders = await _repo.folderDao.getAllFolders();
      emit(state.copyWith(isLoading: false, folders: folders));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onCreated(FolderCreated event, Emitter<FolderState> emit) async {
    await _repo.folderDao.insertFolder(FoldersCompanion.insert(
      id: _uuid.v4(),
      name: event.name,
      parentId: event.parentId == null ? const Value.absent() : Value(event.parentId!),
    ));
    add(FolderLoadRequested());
  }

  Future<void> _onRenamed(FolderRenamed event, Emitter<FolderState> emit) async {
    final folder = await _repo.folderDao.getFolderById(event.id);
    if (folder == null) return;
    await _repo.folderDao.updateFolder(FoldersCompanion(
      id: Value(folder.id),
      name: Value(event.newName),
    ));
    add(FolderLoadRequested());
  }

  Future<void> _onDeleted(FolderDeleted event, Emitter<FolderState> emit) async {
    // Cascade delete children objects/tracks
    await _repo.mapObjectDao.deleteObjectsByFolder(event.id);
    await _repo.trackDao.deleteTracksByFolder(event.id);
    await _repo.folderDao.deleteFolder(event.id);
    add(FolderLoadRequested());
  }

  Future<void> _onVisibilityToggled(FolderVisibilityToggled event, Emitter<FolderState> emit) async {
    final folder = await _repo.folderDao.getFolderById(event.id);
    if (folder == null) return;
    await _repo.folderDao.updateFolder(FoldersCompanion(
      id: Value(folder.id),
      isVisible: Value(event.visible),
    ));
    add(FolderLoadRequested());
  }
}
