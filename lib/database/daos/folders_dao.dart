import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/folders_table.dart';
import 'package:personal_reviews/database/tables/items_table.dart';
part 'folders_dao.g.dart';

@DriftAccessor(tables: [Folders])
class FoldersDao extends DatabaseAccessor<AppDatabase> with _$FoldersDaoMixin {
  FoldersDao(super.attachedDatabase);

  Future<List<Folder>> getAll(bool isDeleted) {
    return (select(folders)..where((t) => t.isDeleted.equals(isDeleted))).get();
  }

  Future<Folder?> getById(int id) {
    return (select(folders)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<Folder>> getByItemIds(List<int> itemIds) {
    return (select(folders).join(
      [innerJoin(Items(), Items().folderId.equalsExp(Folders().id))],
    )).get().then((rows) => rows.map((row) => row.readTable(folders)).toList());
  }

  Stream<List<Folder>> watchAll(bool isDeleted) {
    return (select(
      folders,
    )..where((t) => t.isDeleted.equals(isDeleted))).watch();
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

  Future<bool> setDeletedById(int id, bool isDeleted) {
    return (update(folders)..where((t) => t.id.equals(id)))
        .write(
          FoldersCompanion(
            isDeleted: Value(isDeleted),
            deletedAt: isDeleted ? Value(DateTime.now()) : Value.absent(),
          ),
        )
        .then((rowsAffected) => rowsAffected > 0);
  }
}
