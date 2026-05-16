import 'package:personal_reviews/core/interfaces/search_query.dart';
import 'package:personal_reviews/core/types/where_clause.dart';

class ItemSearchQuery implements SearchQuery {
  final String nameContains;
  final int? categoryIdEquals;
  final bool showDeleted;

  @override
  final int limit;

  @override
  final int offset;

  ItemSearchQuery({
    this.nameContains = '',
    this.categoryIdEquals,
    this.showDeleted = false,
    this.limit = 100,
    this.offset = 0,
  });

  @override
  WhereClause buildWhereClause() {
    List<String> clauses = [];
    List<Object?> args = [];

    if (nameContains.isNotEmpty) {
      clauses.add("name LIKE ?");
      args.add('%$nameContains%');
    }

    if (categoryIdEquals != null) {
      clauses.add("category_id = ?");
      args.add(categoryIdEquals);
    }

    if (!showDeleted) {
      clauses.add("deleted = 0");
    }

    return WhereClause(clauses.isNotEmpty ? clauses.join(' AND ') : '1', args);
  }
}

