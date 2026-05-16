import 'package:personal_reviews/core/interfaces/search_query.dart';
import 'package:personal_reviews/core/types/where_clause.dart';

class ReviewSearchQuery implements SearchQuery {
  final String? commentContains;
  final int? ratingMin;
  final int? ratingMax;
  final int? itemIdEquals;
  final DateTime? createdAtMin;
  final DateTime? createdAtMax;
  final bool showDeleted;

  @override
  final int limit;

  @override
  final int offset;

  ReviewSearchQuery({
    this.commentContains,
    this.ratingMin,
    this.ratingMax,
    this.itemIdEquals,
    this.createdAtMin,
    this.createdAtMax,
    this.showDeleted = false,
    this.limit = 100,
    this.offset = 0,
  });

  @override
  WhereClause buildWhereClause() {
    List<String> clauses = [];
    List<Object?> args = [];

    if (commentContains != null && commentContains!.isNotEmpty) {
      clauses.add("comment LIKE ?");
      args.add('%$commentContains%');
    }

    if (ratingMin != null) {
      clauses.add("rating >= ?");
      args.add(ratingMin);
    }

    if (ratingMax != null) {
      clauses.add("rating <= ?");
      args.add(ratingMax);
    }

    if (itemIdEquals != null) {
      clauses.add("item_id = ?");
      args.add(itemIdEquals);
    }

    if (createdAtMin != null) {
      clauses.add("created_at >= ?");
      args.add(createdAtMin!.toIso8601String());
    }

    if (createdAtMax != null) {
      clauses.add("created_at <= ?");
      args.add(createdAtMax!.toIso8601String());
    }

    if (!showDeleted) {
      clauses.add("deleted = 0");
    }

    return WhereClause(clauses.isNotEmpty ? clauses.join(' AND ') : '1', args);
  }
}