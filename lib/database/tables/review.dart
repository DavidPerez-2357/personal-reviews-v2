import 'package:drift/drift.dart';
import 'package:personal_reviews/database/tables/item.dart';

class Reviews extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rating => integer().check(rating.isBetweenValues(1, 10)).withDefault(const Constant(1))();
  TextColumn get comment => text()();
  IntColumn get deleted => integer().withDefault(const Constant(0)).named('deleted')();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  IntColumn get itemId => integer().references(Items, #id, onDelete: KeyAction.setNull)();
}