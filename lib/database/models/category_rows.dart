import 'package:personal_reviews/database/app_database.dart';

class CategoryWithStatsRow {
  final Category category;
  final int itemCount;

  CategoryWithStatsRow({required this.category, required this.itemCount});
}
