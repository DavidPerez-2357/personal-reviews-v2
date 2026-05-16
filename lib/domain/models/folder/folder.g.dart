// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FolderDomain _$FolderDomainFromJson(Map<String, dynamic> json) =>
    _FolderDomain(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imagePath: json['imagePath'] as String?,
      parentId: (json['parentId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$FolderDomainToJson(_FolderDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'parentId': instance.parentId,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
