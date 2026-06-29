import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/database/tables/folders_table.dart';
import 'package:personal_reviews/database/models/folder_rows.dart';
import 'package:personal_reviews/database/tables/items_table.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/core/types/sort.dart';
import 'package:drift/drift.dart';
part 'folders_dao.g.dart';

@DriftAccessor(tables: [Folders, Items])
class FoldersDao extends DatabaseAccessor<AppDatabase> with _$FoldersDaoMixin {
  FoldersDao(super.attachedDatabase);

  OrderingTerm _getOrderingTerm(ElementsSort sort) {
    final sortOrder = sort.type == SortType.ASC
        ? OrderingMode.asc
        : OrderingMode.desc;

    switch (sort.field) {
      case ElementsSortField.creation:
        return OrderingTerm(expression: folders.id, mode: sortOrder);

      case ElementsSortField.name:
        return OrderingTerm(expression: folders.name, mode: sortOrder);

      case ElementsSortField.date:
        return OrderingTerm(expression: folders.createdAt, mode: sortOrder);

      default:
        return OrderingTerm(expression: folders.id, mode: OrderingMode.asc);
    }
  }

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

  /* Get detailed folder with item count and preview images with sort and filter */
  Future<List<FolderDetailedRow>> queryFolders({
    required ElementsSort sort,
    required ElementsFilter filter,
    String searchQuery = '',
    int? folderId,
    bool includeDeleted = false,
    bool excludeNonDeleted = false,
  }) {
    /* Sort */
    OrderingTerm ordering = _getOrderingTerm(sort);

    /* Filter */
    final categoryFilter = filter.categoryIds.isNotEmpty
        ? folders.categoryId.isIn(filter.categoryIds)
        : const Constant(true);

    /* Search */
    final searchFilter = searchQuery.isNotEmpty
        ? folders.name.like('%$searchQuery%')
        : const Constant(true);

    /* Other options */
    final folderIdFilter = folderId != null
        ? folders.parentId.equals(folderId)
        : const Constant(true);

    final includeDeletedFilter = includeDeleted
        ? const Constant(true)
        : folders.isDeleted.equals(false);

    final excludeNonDeletedFilter = excludeNonDeleted
        ? folders.isDeleted.equals(true)
        : const Constant(true);

    /* Query */
    final query =
        select(folders).join([
            leftOuterJoin(
              items,
              items.folderId.equalsExp(folders.id) &
                  items.isDeleted.equals(false),
            ),
          ])
          ..addColumns([items.id.count()])
          ..where(
            includeDeletedFilter &
                excludeNonDeletedFilter &
                categoryFilter &
                searchFilter &
                folderIdFilter,
          )
          ..groupBy([folders.id])
          ..orderBy([ordering]);

    final rows = query.get();

    return rows.then((rows) async {
      final folderIds = rows.map((row) => row.readTable(folders).id).toList();
      final previewImages = await _getPreviewImagesByFolderIds(folderIds);

      return rows.map((row) {
        final folder = row.readTable(folders);
        final itemCount = row.read(items.id.count()) ?? 0;
        return FolderDetailedRow(
          folder: folder,
          itemCount: itemCount,
          previewImages: previewImages[folder.id] ?? const [],
        );
      }).toList();
    });
  }
}
