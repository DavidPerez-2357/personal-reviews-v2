import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/reviews_table.dart';
part 'reviews_dao.g.dart';

@DriftAccessor(tables: [Reviews])
class ReviewsDao extends DatabaseAccessor<AppDatabase> with _$ReviewsDaoMixin {
  ReviewsDao(super.attachedDatabase);

  Future<List<Review>> getAll() {
    return select(reviews).get();
  }

  Future<Review?> getById(int id) {
    return (select(reviews)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<Review>> getByItemId(int itemId) {
    return (select(reviews)..where((t) => t.itemId.equals(itemId))).get();
  }

  Stream<List<Review>> watchAll() {
    return select(reviews).watch();
  }

  Future<int> create({
    required String comment,
    required int rating,
    required int itemId,
  }) {
    return into(reviews).insert(
      ReviewsCompanion.insert(
        comment: comment,
        rating: Value(rating),
        itemId: itemId,
      ),
    );
  }

  Future<bool> updateById(
    int id, {
    required String comment,
    required int rating,
    required int itemId,
  }) {
    return (update(reviews)..where((t) => t.id.equals(id)))
        .write(
          ReviewsCompanion(
            comment: Value(comment),
            rating: Value(rating),
            itemId: Value(itemId),
            updatedAt: Value(DateTime.now()),
          ),
        )
        .then((rowsAffected) => rowsAffected > 0);
  }

  Future<bool> deleteById(int id) {
    return (delete(reviews)..where((t) => t.id.equals(id))).go().then(
      (rowsAffected) => rowsAffected > 0,
    );
  }
}
