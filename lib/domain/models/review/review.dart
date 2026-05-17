import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
abstract class ReviewDomain with _$ReviewDomain {
  const factory ReviewDomain({
    required int id,
    required String comment,
    required int rating, // 1-10

    required DateTime createdAt,
    DateTime? updatedAt,

    required int itemId,
    Map<int, String>? images, // image id and path

    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _ReviewDomain;

  factory ReviewDomain.fromJson(Map<String, Object?> json) =>
      _$ReviewDomainFromJson(json);
}
