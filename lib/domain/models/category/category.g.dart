// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryDomain _$CategoryDomainFromJson(Map<String, dynamic> json) =>
    _CategoryDomain(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: CategoryColor.fromJson(json['color'] as Map<String, dynamic>),
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$CategoryDomainToJson(_CategoryDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'icon': instance.icon,
      'createdAt': instance.createdAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

PresetCategoryColor _$PresetCategoryColorFromJson(Map<String, dynamic> json) =>
    PresetCategoryColor(
      name: json['name'] as String,
      hex: json['hex'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PresetCategoryColorToJson(
  PresetCategoryColor instance,
) => <String, dynamic>{
  'name': instance.name,
  'hex': instance.hex,
  'runtimeType': instance.$type,
};

CustomCategoryColor _$CustomCategoryColorFromJson(Map<String, dynamic> json) =>
    CustomCategoryColor(
      hex: json['hex'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CustomCategoryColorToJson(
  CustomCategoryColor instance,
) => <String, dynamic>{'hex': instance.hex, 'runtimeType': instance.$type};
