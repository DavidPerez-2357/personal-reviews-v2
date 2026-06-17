import 'package:personal_reviews/core/types/sort.dart';

enum ElementsSortField { name, date, rating }

class ElementsSort {
  bool get isActive => field != null;
  final ElementsSortField? field;
  final SortType type;

  const ElementsSort({this.field, this.type = SortType.ASC});

  ElementsSort copyWith({ElementsSortField? field, SortType? type}) {
    return ElementsSort(field: field ?? this.field, type: type ?? this.type);
  }

  bool compare(ElementsSort other) {
    return field == other.field && type == other.type;
  }
}
