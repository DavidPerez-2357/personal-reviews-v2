
import 'package:personal_reviews/core/types/where_clause.dart';

abstract interface class SearchQuery<T> {
  int get limit;
  int get offset;

  WhereClause buildWhereClause();
}