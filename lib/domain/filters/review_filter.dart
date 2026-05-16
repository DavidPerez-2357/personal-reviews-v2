class ReviewFilter {
  final String? commentContains;
  final int? ratingMin;
  final int? ratingMax;
  final int? itemId;
  final DateTime? createdAfter;
  final DateTime? createdBefore;

  const ReviewFilter({
    this.commentContains,
    this.ratingMin,
    this.ratingMax,
    this.itemId,
    this.createdAfter,
    this.createdBefore,
  });
}
