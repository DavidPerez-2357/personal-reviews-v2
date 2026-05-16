import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class CategoryDomain with _$CategoryDomain {
  const factory CategoryDomain({
    required int id,
    required String name,
    required String color,
    required String icon,
    required DateTime createdAt,
    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _CategoryDomain;

  factory CategoryDomain.fromJson(Map<String, Object?> json) =>
      _$CategoryDomainFromJson(json);
}
