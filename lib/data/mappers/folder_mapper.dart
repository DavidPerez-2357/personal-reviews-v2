import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/domain/models/folder.dart';

class FolderMapper {
  static FolderDomain fromRow(Folder row) {
    return FolderDomain(
      id: row.id,
      name: row.name,
      categoryId: row.categoryId,
      parentId: row.parentId,
      imagePath: row.imagePath,
      createdAt: row.createdAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
    );
  }

  static List<FolderDomain> fromRows(List<Folder> rows) {
    return rows.map((row) => fromRow(row)).toList();
  }
}
