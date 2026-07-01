import 'package:personal_reviews/database/app_database.dart';

class ItemWithLastReviewRow {
  Item item;
  Review? lastReview;

  ItemWithLastReviewRow({required this.item, this.lastReview});
}
