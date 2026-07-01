import 'package:personal_reviews/core/constants/category_colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_reviews/core/utils/colors.dart';
import 'dart:ui';

part 'category.freezed.dart';

@freezed
abstract class CategoryDomain with _$CategoryDomain {
  const factory CategoryDomain({
    required int id,
    required String name,
    required CategoryColor color,
    required String icon,
    required DateTime createdAt,
    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _CategoryDomain;
}

@freezed
sealed class CategoryColor with _$CategoryColor {
  const CategoryColor._();

  const factory CategoryColor.preset({
    required String name,
    required String hex,
  }) = PresetCategoryColor;

  const factory CategoryColor.custom({required String hex}) =
      CustomCategoryColor;

  static final String _hexFormat = r'^#[0-9a-fA-F]{6}$';

  String toDBFormat() =>
      when(preset: (name, _) => 'preset:$name', custom: (hex) => 'custom:$hex');

  Color toColor() => when(
    preset: (_, hex) => hexStringToColor(hex),
    custom: (hex) => hexStringToColor(hex),
  );

  factory CategoryColor.fromPresetName(String name) {
    final hex = presetCategoryColors[name];

    if (hex == null) {
      throw FormatException('[ERROR] Unknown preset CategoryColor: $name');
    }

    return CategoryColor.preset(name: name, hex: hex);
  }

  factory CategoryColor.fromDBFormat(String dbString) {
    final separatorIndex = dbString.indexOf(':');

    if (separatorIndex == -1) {
      throw FormatException(
        '[ERROR] Invalid DB format for CategoryColor: $dbString',
      );
    }

    final typeStr = dbString.substring(0, separatorIndex);
    final value = dbString.substring(separatorIndex + 1);

    switch (typeStr) {
      case 'preset':
        return CategoryColor.fromPresetName(value);

      case 'custom':
        if (!RegExp(_hexFormat).hasMatch(value)) {
          throw FormatException(
            '[ERROR] Invalid hex format for custom CategoryColor: $value',
          );
        }

        return CategoryColor.custom(hex: value);

      default:
        throw FormatException('[ERROR] Unknown CategoryColorType: $typeStr');
    }
  }
}

@freezed
abstract class CategoryWithStats with _$CategoryWithStats {
  const factory CategoryWithStats({
    required CategoryDomain category,
    required int itemCount,
  }) = _CategoryWithStats;
}
