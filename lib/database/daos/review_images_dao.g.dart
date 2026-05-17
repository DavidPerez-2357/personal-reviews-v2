// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_images_dao.dart';

// ignore_for_file: type=lint
mixin _$ReviewImagesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $FoldersTable get folders => attachedDatabase.folders;
  $ItemsTable get items => attachedDatabase.items;
  $ReviewsTable get reviews => attachedDatabase.reviews;
  $ReviewImagesTable get reviewImages => attachedDatabase.reviewImages;
  ReviewImagesDaoManager get managers => ReviewImagesDaoManager(this);
}

class ReviewImagesDaoManager {
  final _$ReviewImagesDaoMixin _db;
  ReviewImagesDaoManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$FoldersTableTableManager get folders =>
      $$FoldersTableTableManager(_db.attachedDatabase, _db.folders);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db.attachedDatabase, _db.items);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db.attachedDatabase, _db.reviews);
  $$ReviewImagesTableTableManager get reviewImages =>
      $$ReviewImagesTableTableManager(_db.attachedDatabase, _db.reviewImages);
}
