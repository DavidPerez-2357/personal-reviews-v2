import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/categories_table.dart';
part 'categories_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(super.attachedDatabase);

  Future<List<Category>> getAll() {
    return select(categories).get();
  }

  Future<Category?> getById(int id) {
    return (select(
      categories,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<List<Category>> watchAll() {
    return select(categories).watch();
  }

  Future<int> create({
    required String name,
    required String color,
    required String icon,
  }) {
    return into(
      categories,
    ).insert(CategoriesCompanion.insert(name: name, color: color, icon: icon));
  }

  Future<bool> updateById(
    int id, {
    required String name,
    required String color,
    required String icon,
  }) {
    return (update(categories)..where((t) => t.id.equals(id)))
        .write(
          CategoriesCompanion(
            name: Value(name),
            color: Value(color),
            icon: Value(icon),
          ),
        )
        .then((rowsAffected) => rowsAffected > 0);
  }

  Future<bool> deleteById(int id) {
    return (delete(categories)..where((t) => t.id.equals(id))).go().then(
      (rowsAffected) => rowsAffected > 0,
    );
  }
}
