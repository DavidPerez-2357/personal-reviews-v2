// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemDomain _$ItemDomainFromJson(Map<String, dynamic> json) => _ItemDomain(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  imagePath: json['imagePath'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  category: CategoryDomain.fromJson(json['category'] as Map<String, dynamic>),
  folder: json['folder'] == null
      ? null
      : FolderDomain.fromJson(json['folder'] as Map<String, dynamic>),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewDomain.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isDeleted: json['isDeleted'] as bool? ?? false,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
);

Map<String, dynamic> _$ItemDomainToJson(_ItemDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'category': instance.category,
      'folder': instance.folder,
      'reviews': instance.reviews,
      'isDeleted': instance.isDeleted,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
