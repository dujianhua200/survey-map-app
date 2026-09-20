import 'package:equatable/equatable.dart';

abstract class FolderEvent extends Equatable {
  const FolderEvent();
  @override
  List<Object?> get props => [];
}

class FolderLoadRequested extends FolderEvent {}

class FolderCreated extends FolderEvent {
  final String name;
  final String? parentId;
  const FolderCreated(this.name, {this.parentId});
  @override
  List<Object?> get props => [name, parentId];
}

class FolderRenamed extends FolderEvent {
  final String id;
  final String newName;
  const FolderRenamed(this.id, this.newName);
  @override
  List<Object?> get props => [id, newName];
}

class FolderDeleted extends FolderEvent {
  final String id;
  const FolderDeleted(this.id);
  @override
  List<Object?> get props => [id];
}

class FolderVisibilityToggled extends FolderEvent {
  final String id;
  final bool visible;
  const FolderVisibilityToggled(this.id, this.visible);
  @override
  List<Object?> get props => [id, visible];
}
