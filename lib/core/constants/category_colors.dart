import 'package:personal_reviews/domain/models/category/category.dart';

abstract final class PresetCategoryColors {
  static const green = CategoryColor.preset(name: 'green', hex: '#1EA500');

  static const orange = CategoryColor.preset(name: 'orange', hex: '#F05000');

  static const blue = CategoryColor.preset(name: 'blue', hex: '#0062FF');

  static const purple = CategoryColor.preset(name: 'purple', hex: '#C000FF');

  static const yellow = CategoryColor.preset(name: 'yellow', hex: '#E88800');

  static const values = [green, orange, blue, purple, yellow];

  static final byName = {
    for (final color in values) (color as PresetCategoryColor).name: color,
  };
}

final presetCategoryColors = PresetCategoryColors.byName;
