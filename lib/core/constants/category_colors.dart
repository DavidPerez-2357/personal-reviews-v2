enum CategoryColorType { preset, custom }

// Preset colors defined before the class so the factory can reference them
CategoryColor green = CategoryColor._internal(name: 'green', hex: '#1EA500');
CategoryColor orange = CategoryColor._internal(name: 'orange', hex: '#F05000');
CategoryColor blue = CategoryColor._internal(name: 'blue', hex: '#0062FF');
CategoryColor purple = CategoryColor._internal(name: 'purple', hex: '#C000FF');

final Map<String, CategoryColor> categoryColors = {
  'green': green,
  'orange': orange,
  'blue': blue,
  'purple': purple,
};

class CategoryColor {
  final String name;
  final String hex;
  final CategoryColorType type;

  CategoryColor({
    required this.name,
    required this.hex,
    this.type = CategoryColorType.preset,
  });

  // Internal constructor used for preset instances declared above.
  CategoryColor._internal({required this.name, required this.hex})
    : type = CategoryColorType.preset;

  String toDBFormat() {
    return '${type.name}:$name';
  }

  factory CategoryColor.fromDBFormat(String dbString) {
    List<String> parts = dbString.split(':');

    if (parts.length != 2) {
      throw FormatException(
        '[ERROR] Invalid DB format for CategoryColor: $dbString',
      );
    }

    String typeStr = parts[0];
    String value = parts[1];

    if (typeStr == 'preset') {
      if (categoryColors.containsKey(value)) {
        return categoryColors[value]!;
      } else {
        throw FormatException(
          '[ERROR] Unknown preset CategoryColor in DB: $value',
        );
      }
    }

    if (typeStr == 'custom') {
      return CategoryColor(
        name: 'Custom: $value',
        hex: value,
        type: CategoryColorType.custom,
      );
    }

    throw FormatException(
      '[ERROR] Unknown CategoryColorType in DB format: $typeStr',
    );
  }
}
