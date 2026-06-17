import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/core/types/sort.dart';
import 'package:personal_reviews/database/models/item_rows.dart';
import 'package:personal_reviews/database/tables/reviews_table.dart';
import 'package:personal_reviews/database/tables/items_table.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:drift/drift.dart';
part 'items_dao.g.dart';

@DriftAccessor(tables: [Items, Reviews])
class ItemsDao extends DatabaseAccessor<AppDatabase> with _$ItemsDaoMixin {
  ItemsDao(super.attachedDatabase);

  OrderingTerm _getOrderingTerm(ElementsSort sort) {
    final sortOrder = sort.type == SortType.ASC
        ? OrderingMode.asc
        : OrderingMode.desc;

    switch (sort.field) {
      case ElementsSortField.name:
        return OrderingTerm(expression: items.name, mode: sortOrder);

      case ElementsSortField.date:
        return OrderingTerm(expression: items.createdAt, mode: sortOrder);

      case ElementsSortField.rating:
        return OrderingTerm(expression: reviews.rating, mode: sortOrder);

      default:
        return OrderingTerm(expression: items.id, mode: OrderingMode.asc);
    }
  }

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

  Future<List<ItemWithLastReviewRow>> queryItems({
    required ElementsSort sort,
    required ElementsFilter filter,
    String searchQuery = '',
    int? folderId,
    bool groupByFolders = false,
    bool includeDeleted = false,
    bool excludeNonDeleted = false,
  }) async {
    /* Sort */
    final OrderingTerm ordering = _getOrderingTerm(sort);

    /* Filter */
    final categoriesAllowedFilter = filter.categoryIds.isNotEmpty
        ? items.categoryId.isIn(filter.categoryIds)
        : const Constant(true);

    final ratingRange = filter.minRating != 0 || filter.maxRating != 10
        ? reviews.rating.isBetweenValues(filter.minRating, filter.maxRating)
        : const Constant(true);

    /* Search */
    final searchFilter = searchQuery.isNotEmpty
        ? items.name.like('%$searchQuery%')
        : const Constant(true);

    /* Other options */
    final groupByFoldersFilter = groupByFolders
        ? (folderId != null
              ? items.folderId.equals(folderId)
              : items.folderId.isNull())
        : (folderId != null
              ? items.folderId.equals(folderId)
              : const Constant(true));

    final includeDeletedFilter = includeDeleted
        ? const Constant(true)
        : items.isDeleted.equals(false);

    final excludeNonDeletedFilter = excludeNonDeleted
        ? items.isDeleted.equals(true)
        : const Constant(true);

    final includeDeletedReviewsFilter = includeDeleted
        ? const Constant(true)
        : reviews.isDeleted.equals(false);

    final excludeNonDeletedReviewsFilter = excludeNonDeleted
        ? reviews.isDeleted.equals(true)
        : const Constant(true);

    /* Query */
    final query =
        select(items).join([
            leftOuterJoin(
              reviews,
              reviews.itemId.equalsExp(items.id) &
                  includeDeletedReviewsFilter &
                  excludeNonDeletedReviewsFilter,
            ),
          ])
          ..where(
            categoriesAllowedFilter &
                ratingRange &
                searchFilter &
                groupByFoldersFilter &
                includeDeletedFilter &
                excludeNonDeletedFilter,
          )
          ..orderBy([ordering])
          ..groupBy([items.id]);

    final rows = await query.get();

    final List<ItemWithLastReviewRow> result = [];

    for (final row in rows) {
      final item = row.readTable(items);

      result.add(
        ItemWithLastReviewRow(
          item: item,
          lastReview: row.readTableOrNull(reviews),
        ),
      );
    }

    return result;
  }
}
