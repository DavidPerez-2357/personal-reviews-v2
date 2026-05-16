class ItemFilter {
  final String? nameContains;
  final int? categoryIdEquals;

  ItemFilter({this.nameContains = '', this.categoryIdEquals});
}

class ItemReviewsFilter {
  final int? itemIdEquals;
  final String? itemNameContains;
  final String? commentContains;
  final int? ratingMin;
  final int? ratingMax;
  final DateTime? reviewCreatedAtMin;
  final DateTime? reviewCreatedAtMax;

  ItemReviewsFilter({
    this.itemIdEquals,
    this.itemNameContains,
    this.commentContains = '',
    this.ratingMin,
    this.ratingMax,
    this.reviewCreatedAtMin,
    this.reviewCreatedAtMax,
  });
}
