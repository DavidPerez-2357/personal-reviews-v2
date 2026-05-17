// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders_dao.dart';

// ignore_for_file: type=lint
mixin _$FoldersDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $FoldersTable get folders => attachedDatabase.folders;
  FoldersDaoManager get managers => FoldersDaoManager(this);
}

class FoldersDaoManager {
  final _$FoldersDaoMixin _db;
  FoldersDaoManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$FoldersTableTableManager get folders =>
      $$FoldersTableTableManager(_db.attachedDatabase, _db.folders);
}
