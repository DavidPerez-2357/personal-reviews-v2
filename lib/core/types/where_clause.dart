
class WhereClause {
  final String clause;
  final List<Object?> args;

  WhereClause(this.clause, [this.args = const []]);
}