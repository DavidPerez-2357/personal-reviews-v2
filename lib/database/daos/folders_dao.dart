import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/folder.dart';
part 'folders_dao.g.dart';

@DriftAccessor(tables: [Folders])
class FoldersDao extends DatabaseAccessor<AppDatabase> with _$FoldersDaoMixin {
  FoldersDao(super.attachedDatabase);

  Future<List<Folder>> getAll() {
    return select(folders).get();
  }

  Future<Folder?> getById(int id) {
    return (select(folders)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<List<Folder>> watchAll() {
    return select(folders).watch();
  }

  Future<int> create({
    required String name,
    required int categoryId,
    int? parentId,
    String? imagePath,
  }) {
    return into(folders).insert(
      FoldersCompanion.insert(
        name: name,
        categoryId: categoryId,
        parentId: Value(parentId),
        imagePath: Value(imagePath),
      ),
    );
  }

  Future<bool> updateById(
    int id, {
    required String name,
    required int categoryId,
    int? parentId,
    String? imagePath,
  }) {
    return (update(folders)..where((t) => t.id.equals(id)))
        .write(
          FoldersCompanion(
            name: Value(name),
            categoryId: Value(categoryId),
            parentId: Value(parentId),
            imagePath: Value(imagePath),
          ),
        )
        .then((rowsAffected) => rowsAffected > 0);
  }

  Future<bool> deleteById(int id) {
    return (delete(folders)..where((t) => t.id.equals(id))).go().then(
      (rowsAffected) => rowsAffected > 0,
    );
  }
}
