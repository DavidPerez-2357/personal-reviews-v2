import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/item.dart';
part 'items_dao.g.dart';

@DriftAccessor(tables: [Items])
class ItemsDao extends DatabaseAccessor<AppDatabase> with _$ItemsDaoMixin {
  ItemsDao(super.attachedDatabase);

  Future<List<Item>> getAll() {
    return select(items).get();
  }

  Future<Item?> getById(int id) {
    return (select(items)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<List<Item>> watchAll() {
    return select(items).watch();
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

  Future<bool> deleteById(int id) {
    return (delete(items)..where((t) => t.id.equals(id))).go().then(
      (rowsAffected) => rowsAffected > 0,
    );
  }
}
