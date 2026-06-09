import 'package:personal_reviews/database/models/item_rows.dart';
import 'package:personal_reviews/database/tables/reviews_table.dart';
import 'package:personal_reviews/database/tables/items_table.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:drift/drift.dart';
part 'items_dao.g.dart';

@DriftAccessor(tables: [Items, Reviews])
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

  /* Item with last review */
  Stream<List<ItemWithLastReviewRow>> watchItemsWithLastReviewByCategoryId(
    int categoryId,
  ) {
    final query =
        select(items).join([
            leftOuterJoin(
              reviews,
              reviews.itemId.equalsExp(items.id) &
                  reviews.isDeleted.equals(false),
            ),
          ])
          ..where(
            items.categoryId.equals(categoryId) &
                items.folderId.isNull() &
                items.isDeleted.equals(false),
          )
          ..orderBy([
            OrderingTerm(expression: items.id, mode: OrderingMode.asc),
            OrderingTerm(
              expression: reviews.createdAt,
              mode: OrderingMode.desc,
            ),
          ]);

    return query.watch().map((rows) {
      final result = <int, ItemWithLastReviewRow>{};

      for (final row in rows) {
        final item = row.readTable(items);

        result.putIfAbsent(
          item.id,
          () => ItemWithLastReviewRow(
            item: item,
            lastReview: row.readTableOrNull(reviews),
          ),
        );
      }

      return result.values.toList();
    });
  }

  Stream<List<ItemWithLastReviewRow>> watchItemsWithLastReviewByFolderId(
    int folderId,
  ) {
    final query =
        select(items).join([
            leftOuterJoin(
              reviews,
              reviews.itemId.equalsExp(items.id) &
                  reviews.isDeleted.equals(false),
            ),
          ])
          ..where(
            items.folderId.equals(folderId) & items.isDeleted.equals(false),
          )
          ..orderBy([
            OrderingTerm(expression: items.id, mode: OrderingMode.asc),
            OrderingTerm(
              expression: reviews.createdAt,
              mode: OrderingMode.desc,
            ),
          ]);

    return query.watch().map((rows) {
      final result = <int, ItemWithLastReviewRow>{};

      for (final row in rows) {
        final item = row.readTable(items);

        result.putIfAbsent(
          item.id,
          () => ItemWithLastReviewRow(
            item: item,
            lastReview: row.readTableOrNull(reviews),
          ),
        );
      }

      return result.values.toList();
    });
  }
}
