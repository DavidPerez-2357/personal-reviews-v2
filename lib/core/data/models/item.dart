import 'package:personal_reviews/core/data/models/folder.dart';
import 'package:personal_reviews/core/data/models/review.dart';
import 'package:personal_reviews/core/data/models/category.dart';
import 'package:personal_reviews/core/interfaces/db_model.dart';

class ItemFull {
  final int id;
  final String name;
  final String? imagePath;

  final DateTime createdAt;
  final DateTime? updatedAt;

  final Category category;
  final FolderMin? folder;

  const ItemFull({
    required this.id,
    required this.name,
    this.imagePath,
    required this.createdAt,
    this.updatedAt,
    required this.category,
    this.folder,
  });

  ItemMin toMin() {
    return ItemMin(
      id: id,
      name: name,
      imagePath: imagePath,
      createdAt: createdAt,
      updatedAt: updatedAt,
      categoryId: category.id,
      folderId: folder?.id,
    );
  }
}


class ItemMin implements DbModel<ItemMin> {
  final int id;
  final String name;
  final String? imagePath;

  final DateTime createdAt;
  final DateTime? updatedAt;

  final int categoryId;
  final int? folderId;

  const ItemMin({
    required this.id,
    required this.name,
    this.imagePath,
    required this.createdAt,
    this.updatedAt,
    required this.categoryId,
    this.folderId,
  });

  @override
  factory ItemMin.fromJson(Map<String, dynamic> map) {
    return ItemMin(
      id: map['id'],
      name: map['name'],
      imagePath: map['image_path'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : null,
      categoryId: map['category_id'],
      folderId: map['folder_id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_path': imagePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'category_id': categoryId,
      'folder_id': folderId,
    };
  }
}

class ItemReviews {
  final ItemFull item;
  final List<ReviewMin> reviews;

  const ItemReviews({required this.item, required this.reviews});
}
