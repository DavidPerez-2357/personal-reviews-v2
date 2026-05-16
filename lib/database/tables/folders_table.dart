import 'package:drift/drift.dart';
import 'package:personal_reviews/database/tables/categories_table.dart';

@TableIndex(
  name: 'folders_index',
  columns: {#categoryId, #parentId, #isDeleted},
)
class Folders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get imagePath => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  IntColumn get parentId => integer().nullable().references(
    Folders,
    #id,
    onDelete: KeyAction.setNull,
  )();
  IntColumn get categoryId =>
      integer().references(Categories, #id, onDelete: KeyAction.setNull)();
}
