
import 'package:personal_reviews/core/interfaces/search_query.dart';
import 'package:personal_reviews/core/types/where_clause.dart';

class ItemReviewsSearchQuery implements SearchQuery {
  // Item-related filters
  final String? itemNameContains;
  final int? categoryIdEquals;
  final bool showDeletedItems;

  // Review-related filters
  final String? commentContains;
  final int? ratingMin;
  final int? ratingMax;
  final DateTime? createdAtMin;
  final DateTime? createdAtMax;
  final bool showDeletedReviews;

  @override
  final int limit;

  @override
  final int offset;

  ItemReviewsSearchQuery({
    this.itemNameContains,
    this.categoryIdEquals,
    this.showDeletedItems = false,
    this.commentContains,
    this.ratingMin,
    this.ratingMax,
    this.createdAtMin,
    this.createdAtMax,
    this.showDeletedReviews = false,
    this.limit = 100,
    this.offset = 0,
  });

  @override
  WhereClause buildWhereClause() {
    List<String> clauses = [];
    List<Object?> args = [];

    // Item filters
    if (categoryIdEquals != null) {
      clauses.add("i.category_id = ?");
      args.add(categoryIdEquals);
    }

    if (!showDeletedItems) {
      clauses.add("i.deleted = 0");
    }

    // Review filters
    if (ratingMin != null) {
      clauses.add("r.rating >= ?");
      args.add(ratingMin);
    }

    if (ratingMax != null) {
      clauses.add("r.rating <= ?");
      args.add(ratingMax);
    }

    if (createdAtMin != null) {
      clauses.add("r.created_at >= ?");
      args.add(createdAtMin!.toIso8601String());
    }

    if (createdAtMax != null) {
      clauses.add("r.created_at <= ?");
      args.add(createdAtMax!.toIso8601String());
    }

    if (!showDeletedReviews) {
      clauses.add("r.deleted = 0");
    }

    // All string filters apply together with OR
    List<String> itemStringClauses = [];

    if (itemNameContains != null && itemNameContains!.isNotEmpty) {
      itemStringClauses.add("i.name LIKE ?");
      args.add('%$itemNameContains%');
    }

    if (commentContains != null && commentContains!.isNotEmpty) {
      itemStringClauses.add("r.comment LIKE ?");
      args.add('%$commentContains%');
    }

    if (itemStringClauses.isNotEmpty) {
      clauses.add("(${itemStringClauses.join(' OR ')})");
    }

    return WhereClause(clauses.isNotEmpty ? clauses.join(' AND ') : '1', args);
  }
}