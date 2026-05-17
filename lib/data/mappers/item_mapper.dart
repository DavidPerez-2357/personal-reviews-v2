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
    CategoryDomain categoryDomain = CategoryMapper.fromRow(category);

    FolderDomain? folderDomain = folder != null
        ? FolderMapper.fromRow(folder)
        : null;

    List<ReviewDomain> reviewsDomain = ReviewMapper.fromRows(
      reviews ?? [],
      reviewImages,
    );

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

  static List<ItemDomain> fromRows(
    List<Item> rows,
    List<Category> categories,
    List<Folder>? folders,
    List<Review>? reviews,
    List<ReviewImage>? reviewImages,
  ) {
    Map<int, Category> categoryById = {
      for (var category in categories) category.id: category,
    };

    Map<int, Folder> folderById = {};
    if (folders != null) {
      folderById = {for (var folder in folders) folder.id: folder};
    }

    Map<int, List<Review>> reviewsByItemId = {};
    if (reviews != null) {
      for (var review in reviews) {
        reviewsByItemId.putIfAbsent(review.itemId, () => []).add(review);
      }
    }

    return rows.map((row) {
      final category = categoryById[row.categoryId]!;
      final folder = row.folderId != null ? folderById[row.folderId!] : null;
      final itemReviews = reviewsByItemId[row.id] ?? [];
      return fromRow(row, category, folder, itemReviews, reviewImages);
    }).toList();
  }
}
