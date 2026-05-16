import 'package:personal_reviews/data/mappers/category_mapper.dart';
import 'package:personal_reviews/data/mappers/folder_mapper.dart';
import 'package:personal_reviews/data/mappers/review_mapper.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/domain/models/category/category.dart';
import 'package:personal_reviews/domain/models/folder/folder.dart';
import 'package:personal_reviews/domain/models/item/item.dart';
import 'package:personal_reviews/domain/models/review/review.dart';

class ItemMapper {
  static ItemDomain fromRow(
    Item row,
    Category category,
    Folder? folder,
    List<Review>? reviews,
    List<ReviewImage>? reviewImages,
  ) {
    Map<int, List<ReviewImage>> imagesByReviewId = {};

    if (reviewImages != null) {
      for (var image in reviewImages) {
        imagesByReviewId.putIfAbsent(image.reviewId, () => []).add(image);
      }
    }

    CategoryDomain categoryDomain = CategoryMapper.fromRow(category);

    FolderDomain? folderDomain = folder != null
        ? FolderMapper.fromRow(folder)
        : null;

    List<ReviewDomain> reviewsDomain = reviews != null
        ? reviews
              .map(
                (review) =>
                    ReviewMapper.fromRow(review, imagesByReviewId[review.id]),
              )
              .toList()
        : [];

    return ItemDomain(
      id: row.id,
      name: row.name,
      imagePath: row.imagePath,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      category: categoryDomain,
      folder: folderDomain,
      reviews: reviewsDomain,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
    );
  }
}
