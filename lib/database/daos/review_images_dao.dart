import 'package:drift/drift.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/tables/review_images_table.dart';
part 'review_images_dao.g.dart';

@DriftAccessor(tables: [ReviewImages])
class ReviewImagesDao extends DatabaseAccessor<AppDatabase>
    with _$ReviewImagesDaoMixin {
  ReviewImagesDao(super.attachedDatabase);

  Future<List<ReviewImage>> getAll() {
    return select(reviewImages).get();
  }

  Future<ReviewImage?> getById(int id) {
    return (select(
      reviewImages,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<ReviewImage>> getByReviewId(int reviewId) {
    return (select(
      reviewImages,
    )..where((t) => t.reviewId.equals(reviewId))).get();
  }

  Stream<List<ReviewImage>> watchAll() {
    return select(reviewImages).watch();
  }

  Future<int> create({required int reviewId, required String imagePath}) {
    return into(reviewImages).insert(
      ReviewImagesCompanion.insert(reviewId: reviewId, imagePath: imagePath),
    );
  }

  Future<bool> updateById(
    int id, {
    required int reviewId,
    required String imagePath,
  }) {
    return (update(reviewImages)..where((t) => t.id.equals(id)))
        .write(
          ReviewImagesCompanion(
            reviewId: Value(reviewId),
            imagePath: Value(imagePath),
          ),
        )
        .then((rowsAffected) => rowsAffected > 0);
  }

  Future<bool> deleteById(int id) {
    return (delete(reviewImages)..where((t) => t.id.equals(id))).go().then(
      (rowsAffected) => rowsAffected > 0,
    );
  }
}
