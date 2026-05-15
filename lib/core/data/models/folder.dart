import 'package:personal_reviews/core/data/models/category.dart';
import 'package:personal_reviews/core/interfaces/db_model.dart';

class FolderFull {
  final int id;
  final String name;
  final String? imagePath;

  final FolderFull? parent;
  final Category category;

  const FolderFull({
    required this.id,
    required this.name,
    this.imagePath,
    this.parent,
    required this.category,
  });

  FolderMin toMin() {
    return FolderMin(
      id: id,
      name: name,
      imagePath: imagePath,
      parentId: parent?.id,
      categoryId: category.id,
    );
  }
}

class FolderMin implements DbModel<FolderMin> {
  final int id;
  final String name;
  final String? imagePath;
  final int? parentId;
  final int categoryId;

  const FolderMin({
    required this.id,
    required this.name,
    this.imagePath,
    this.parentId,
    required this.categoryId,
  });

  @override
  factory FolderMin.fromJson(Map<String, dynamic> map) {
    return FolderMin(
      id: map['id'],
      name: map['name'],
      imagePath: map['image_path'],
      parentId: map['parent_id'],
      categoryId: map['category_id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_path': imagePath,
      'parent_id': parentId,
      'category_id': categoryId,
    };
  }
}
