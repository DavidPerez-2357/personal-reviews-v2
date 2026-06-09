import 'package:drift/drift.dart';
import 'package:personal_reviews/database/models/folder_rows.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/folders_table.dart';
import 'package:personal_reviews/database/tables/items_table.dart';
part 'folders_dao.g.dart';

@DriftAccessor(tables: [Folders, Items])
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

  Future<List<Folder>> getByCategoryId(int categoryId, bool isDeleted) {
    return (select(folders)..where(
          (t) =>
              t.categoryId.equals(categoryId) & t.isDeleted.equals(isDeleted),
        ))
        .get();
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

  /* Folder detailed with item count and preview images */
  Stream<List<FolderDetailedRow>> watchFoldersDetailedByCategoryId(
    int categoryId,
    bool isDeleted,
  ) {
    return _watchFoldersWithItemCount(categoryId, isDeleted).asyncMap((
      foldersWithCount,
    ) async {
      if (foldersWithCount.isEmpty) {
        return [];
      }

      final previewImages = await _getPreviewImagesByFolderIds(
        foldersWithCount.map((e) => e.folder.id).toList(),
      );

      return foldersWithCount.map((folderData) {
        return FolderDetailedRow(
          folder: folderData.folder,
          itemCount: folderData.itemCount,
          previewImages: previewImages[folderData.folder.id] ?? const [],
        );
      }).toList();
    });
  }

  Stream<List<FolderWithItemCountRow>> _watchFoldersWithItemCount(
    int categoryId,
    bool isDeleted,
  ) {
    final folderAlias = alias(folders, 'f');
    final itemAlias = alias(items, 'i');

    final itemCountExpression = itemAlias.id.count();

    final query =
        select(folderAlias).join([
            leftOuterJoin(
              itemAlias,
              itemAlias.folderId.equalsExp(folderAlias.id) &
                  itemAlias.isDeleted.equals(false),
            ),
          ])
          ..where(
            folderAlias.categoryId.equals(categoryId) &
                folderAlias.isDeleted.equals(isDeleted),
          )
          ..addColumns([itemCountExpression])
          ..groupBy([folderAlias.id]);

    final rows = query.watch();

    return rows.map((rows) {
      return rows.map((row) {
        return FolderWithItemCountRow(
          folder: row.readTable(folderAlias),
          itemCount: row.read(itemCountExpression) ?? 0,
        );
      }).toList();
    });
  }

  Future<Map<int, List<String>>> _getPreviewImagesByFolderIds(
    List<int> folderIds,
  ) async {
    if (folderIds.isEmpty) {
      return {};
    }

    final imageItems =
        await (select(items)..where(
              (tbl) =>
                  tbl.folderId.isIn(folderIds) &
                  tbl.imagePath.isNotNull() &
                  tbl.isDeleted.equals(false),
            ))
            .get();

    final previews = <int, List<String>>{};

    for (final item in imageItems) {
      final images = previews.putIfAbsent(item.folderId ?? 0, () => []);

      if (images.length < 4) {
        images.add(item.imagePath!);
      }
    }

    return previews;
  }
}
