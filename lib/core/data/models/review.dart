import 'package:personal_reviews/core/data/models/item.dart';
import 'package:personal_reviews/core/interfaces/db_model.dart';

class ReviewFull {
  final int id;
  final String comment;
  final int rating; // 1-10

  final DateTime createdAt;
  final DateTime? updatedAt;

  final ItemMin item;
  final List<ReviewImage> images;
  
  ReviewFull({
    required this.id,
    required this.comment,
    required this.rating,
    required this.createdAt,
    this.updatedAt,
    required this.item,
    required this.images,
  });

  ReviewMin toMin() {
    return ReviewMin(
      id: id,
      comment: comment,
      rating: rating,
      createdAt: createdAt,
      updatedAt: updatedAt,
      itemId: item.id,
    );
  }
}

class ReviewMin implements DbModel<ReviewMin> {
  final int id;
  final String comment;
  final int rating; // 1-10
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int itemId;

  ReviewMin({
    required this.id,
    required this.comment,
    required this.rating,
    required this.createdAt,
    this.updatedAt,
    required this.itemId,
  });

  factory ReviewMin.fromJson(Map<String, dynamic> map) {
    return ReviewMin(
      id: map['id'],
      comment: map['comment'],
      rating: map['rating'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      itemId: map['item_id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'item_id': itemId,
    };
  }
}

class ReviewImage implements DbModel<ReviewImage> {
  final int id;
  final String imagePath;

  ReviewImage({
    required this.id,
    required this.imagePath,
  });

  @override
  factory ReviewImage.fromJson(Map<String, dynamic> map) {
    return ReviewImage(
      id: map['id'],
      imagePath: map['image_path'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_path': imagePath,
    };
  }
}