import 'package:drift/drift.dart';
import 'package:personal_reviews/database/tables/review.dart';

@TableIndex(name: 'review_images_index', columns: {#reviewId})
class ReviewImages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get imagePath => text()();

  IntColumn get reviewId => integer().references(Reviews, #id, onDelete: KeyAction.setNull)();
}
