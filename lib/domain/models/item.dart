import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_reviews/domain/models/review.dart';

part 'item.freezed.dart';

@freezed
abstract class ItemDomain with _$ItemDomain {
  const factory ItemDomain({
    required int id,
    required String name,
    String? imagePath,

    required DateTime createdAt,
    DateTime? updatedAt,

    required int categoryId,
    int? folderId,

    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _ItemDomain;
}

@freezed
abstract class ItemWithLastReview with _$ItemWithLastReview {
  const factory ItemWithLastReview({
    required ItemDomain item,
    ReviewDomain? lastReview,
  }) = _ItemWithLastReview;
}
