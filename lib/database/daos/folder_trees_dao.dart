import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/folder_trees_table.dart';
part 'folder_trees_dao.g.dart';

@DriftAccessor(tables: [FolderTrees])
class FolderTreesDao extends DatabaseAccessor<AppDatabase>
    with _$FolderTreesDaoMixin {
  FolderTreesDao(super.attachedDatabase);

  /// Get the folder and all its parent folders. D -> D, C, B, A
  Future<List<FolderTree>> getByDescendantId(int folderId) {
    return (select(
      folderTrees,
    )..where((tbl) => tbl.descendantId.equals(folderId))).get();
  }

  /// Get the folder and all its child folders. D -> D, E, F, G
  Future<List<FolderTree>> getByAncestorId(int folderId) {
    return (select(
      folderTrees,
    )..where((tbl) => tbl.ancestorId.equals(folderId))).get();
  }

  Future<List<int>> getIdsByAncestorId(int ancestorId) async {
    final results = await getByAncestorId(ancestorId);
    return results.map((row) => row.descendantId).toList();
  }

  Future<List<int>> getIdsByAncestorIds(List<int> ancestorIds) async {
    return (select(folderTrees)
          ..where((tbl) => tbl.ancestorId.isIn(ancestorIds)))
        .get()
        .then((rows) => rows.map((row) => row.descendantId).toList());
  }

  Future<List<int>> getIdsByDescendantId(int descendantId) async {
    final results = await getByDescendantId(descendantId);
    return results.map((row) => row.ancestorId).toList();
  }

  /// Inserts all relations in the folder tree for a new folder.
  Future<void> insertFolderTree(int folderId, int? parentId) {
    return batch((batch) async {
      // Insert the relation to itself
      batch.insert(
        folderTrees,
        FolderTree(descendantId: folderId, ancestorId: folderId, depth: 0),
      );

      if (parentId == null) {
        return;
      }

      // Insert relations to ancestors
      final ancestors = await getByDescendantId(parentId);

      for (final ancestor in ancestors) {
        batch.insert(
          folderTrees,
          FolderTree(
            descendantId: folderId,
            ancestorId: ancestor.ancestorId,
            depth: ancestor.depth + 1,
          ),
        );
      }
    });
  }

  /// This is useful when deleting a folder, its subfolders and relations in the folder tree.
  Future<void> deleteFolderTree(int folderTreeId) {
    return (delete(folderTrees)..where(
          (tbl) =>
              tbl.descendantId.equals(folderTreeId) |
              tbl.ancestorId.equals(folderTreeId),
        ))
        .go();
  }

  /// This only deletes the folder if not used by any other folder as a parent.
  Future<bool> safeDeleteFolderTree(int folderTreeId) async {
    final isUsedAsParent = await getByAncestorId(folderTreeId);

    if (isUsedAsParent.length > 1) {
      return false;
    }

    await deleteFolderTree(folderTreeId);

    return true;
  }

  Future<void> updateFolderTree(int folderId, int? newParentId) async {
    return transaction(() async {
      // Delete the old relations
      await deleteFolderTree(folderId);

      // Insert the new relations
      await insertFolderTree(folderId, newParentId);
    });
  }
}
