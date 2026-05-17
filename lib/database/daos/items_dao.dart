import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/items_table.dart';
part 'items_dao.g.dart';

@DriftAccessor(tables: [Items])
class ItemsDao extends DatabaseAccessor<AppDatabase> with _$ItemsDaoMixin {
  ItemsDao(super.attachedDatabase);

  Future<List<Item>> getAll(bool isDeleted) {
    return (select(items)..where((t) => t.isDeleted.equals(isDeleted))).get();
  }

  Future<Item?> getById(int id) {
    return (select(items)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<List<Item>> watchAll(bool isDeleted) {
    return (select(items)..where((t) => t.isDeleted.equals(isDeleted))).watch();
  }

  Future<int> create({
    required String name,
    required int categoryId,
    int? folderId,
    String? imagePath,
  }) {
    return into(items).insert(
      ItemsCompanion.insert(
        name: name,
        categoryId: categoryId,
        folderId: Value(folderId),
        imagePath: Value(imagePath),
      ),
    );
  }

  Future<bool> updateById(
    int id, {
    required String name,
    required int categoryId,
    int? folderId,
    String? imagePath,
  }) {
    return (update(items)..where((t) => t.id.equals(id)))
        .write(
          ItemsCompanion(
            name: Value(name),
            categoryId: Value(categoryId),
            folderId: Value(folderId),
            imagePath: Value(imagePath),
            updatedAt: Value(DateTime.now()),
          ),
        )
        .then((rowsAffected) => rowsAffected > 0);
  }

  Future<bool> setDeletedById(int id, bool isDeleted) {
    return (update(items)..where((t) => t.id.equals(id)))
        .write(
          ItemsCompanion(
            isDeleted: Value(isDeleted),
            deletedAt: isDeleted ? Value(DateTime.now()) : Value.absent(),
          ),
        )
        .then((rowsAffected) => rowsAffected > 0);
  }
}
