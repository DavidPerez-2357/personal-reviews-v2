import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_reviews/domain/models/category/category.dart';
import 'package:personal_reviews/domain/models/folder/folder.dart';
import 'package:personal_reviews/domain/models/review/review.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
abstract class ItemDomain with _$ItemDomain {
  const factory ItemDomain({
    required int id,
    required String name,
    String? imagePath,

    required DateTime createdAt,
    DateTime? updatedAt,

    required CategoryDomain category,
    FolderDomain? folder,

    @Default([]) List<ReviewDomain> reviews,

    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _ItemDomain;

  factory ItemDomain.fromJson(Map<String, dynamic> json) =>
      _$ItemDomainFromJson(json);
}
