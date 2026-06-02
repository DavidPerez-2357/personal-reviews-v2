import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/domain/models/review.dart';

class ReviewMapper {
  static ReviewDomain fromRow(Review row, List<ReviewImage>? images) {
    Map<int, String> imagesById = {};

    if (images != null) {
      for (var image in images) {
        imagesById[image.reviewId] = image.imagePath;
      }
    }

    return ReviewDomain(
      id: row.id,
      comment: row.comment,
      rating: row.rating,
      itemId: row.itemId,
      createdAt: row.createdAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      images: imagesById,
    );
  }

  static List<ReviewDomain> fromRows(
    List<Review> rows,
    List<ReviewImage>? images,
  ) {
    Map<int, List<ReviewImage>> imagesByReviewId = {};

    if (images != null) {
      for (var image in images) {
        imagesByReviewId.putIfAbsent(image.reviewId, () => []).add(image);
      }
    }

    return rows.map((row) => fromRow(row, imagesByReviewId[row.id])).toList();
  }
}
