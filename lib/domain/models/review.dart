import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_reviews/domain/models/category.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/domain/models/item.dart';

part 'review.freezed.dart';

@freezed
abstract class ReviewDomain with _$ReviewDomain {
  const factory ReviewDomain({
    required int id,
    required String comment,
    required double rating, // 0.0 to 5.0

    required DateTime createdAt,
    DateTime? updatedAt,

    required int itemId,
    Map<int, String>? images, // image id and path

    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _ReviewDomain;
}

@freezed
abstract class ReviewDetailed with _$ReviewDetailed {
  const factory ReviewDetailed({
    required ReviewDomain review,
    ItemDomain? item,
    CategoryDomain? category,
    @Default([]) List<FolderDomain> folderPath,
  }) = _ReviewDetailed;
}
