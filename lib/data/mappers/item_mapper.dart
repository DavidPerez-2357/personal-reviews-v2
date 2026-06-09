import 'package:personal_reviews/data/mappers/review_mapper.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/models/item_rows.dart';
import 'package:personal_reviews/domain/models/item.dart';

class ItemMapper {
  static ItemDomain fromRow(Item row) {
    return ItemDomain(
      id: row.id,
      name: row.name,
      imagePath: row.imagePath,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      categoryId: row.categoryId,
      folderId: row.folderId,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
    );
  }

  static List<ItemDomain> fromRows(List<Item> rows) {
    return rows.map(fromRow).toList();
  }
}

class ItemWithLastReviewMapper {
  static ItemWithLastReview fromRow(Item item, Review? lastReview) {
    return ItemWithLastReview(
      item: ItemMapper.fromRow(item),
      lastReview: lastReview != null
          ? ReviewMapper.fromRow(lastReview, null)
          : null,
    );
  }

  static List<ItemWithLastReview> fromRows(List<ItemWithLastReviewRow> dtos) {
    return dtos.map((dto) => fromRow(dto.item, dto.lastReview)).toList();
  }
}
