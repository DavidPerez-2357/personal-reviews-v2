import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/domain/models/category.dart';

class CategoryMapper {
  static CategoryDomain fromRow(Category row, int? reviewCount) {
    return CategoryDomain(
      id: row.id,
      name: row.name,
      color: CategoryColor.fromDBFormat(row.color),
      icon: row.icon,
      reviewCount: reviewCount ?? 0,
      createdAt: row.createdAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
    );
  }

  static List<CategoryDomain> fromRows(List<Category> rows) {
    return rows.map((row) => fromRow(row, null)).toList();
  }
}
