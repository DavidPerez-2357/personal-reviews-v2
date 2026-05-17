import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder.freezed.dart';
part 'folder.g.dart';

@freezed
abstract class FolderDomain with _$FolderDomain {
  const factory FolderDomain({
    required int id,
    required String name,
    String? imagePath,
    int? parentId,
    required int categoryId,

    required DateTime createdAt,

    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _FolderDomain;

  factory FolderDomain.fromJson(Map<String, Object?> json) =>
      _$FolderDomainFromJson(json);
}
