// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_trees_dao.dart';

// ignore_for_file: type=lint
mixin _$FolderTreesDaoMixin on DatabaseAccessor<AppDatabase> {
  $FoldersTable get folders => attachedDatabase.folders;
  $FolderTreesTable get folderTrees => attachedDatabase.folderTrees;
  FolderTreesDaoManager get managers => FolderTreesDaoManager(this);
}

class FolderTreesDaoManager {
  final _$FolderTreesDaoMixin _db;
  FolderTreesDaoManager(this._db);
  $$FoldersTableTableManager get folders =>
      $$FoldersTableTableManager(_db.attachedDatabase, _db.folders);
  $$FolderTreesTableTableManager get folderTrees =>
      $$FolderTreesTableTableManager(_db.attachedDatabase, _db.folderTrees);
}
