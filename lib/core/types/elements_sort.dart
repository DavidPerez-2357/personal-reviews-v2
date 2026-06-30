import 'package:personal_reviews/core/types/sort.dart';

enum ElementsSortField { creation, name, date, rating }

class ElementsSort {
  final ElementsSortField field;
  final SortType type;

  const ElementsSort({
    this.field = ElementsSortField.creation,
    this.type = SortType.DESC,
  });

  ElementsSort copyWith({ElementsSortField? field, SortType? type}) {
    return ElementsSort(field: field ?? this.field, type: type ?? this.type);
  }

  bool compare(ElementsSort other) {
    return field == other.field && type == other.type;
  }
}
