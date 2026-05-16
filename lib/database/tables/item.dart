import 'package:drift/drift.dart';
import 'package:personal_reviews/database/tables/category.dart';
import 'package:personal_reviews/database/tables/folder.dart';

@TableIndex(name: 'items_index', columns: {#categoryId, #folderId, #isDeleted})
class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get imagePath => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  IntColumn get categoryId =>
      integer().references(Categories, #id, onDelete: KeyAction.setNull)();

  IntColumn get folderId => integer().nullable().references(
    Folders,
    #id,
    onDelete: KeyAction.setNull,
  )();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
