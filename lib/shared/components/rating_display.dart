import 'package:flutter/material.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/core/types/rating.dart';

class RatingDisplay extends StatelessWidget {
  final int rating;
  final double size;
  final Color? fillColor;
  final Color? emptyColor;
  final RatingConverter convertRating;

  const RatingDisplay({
    super.key,
    required this.rating,
    this.size = 20,
    this.fillColor,
    this.emptyColor,
    this.convertRating = defaultRatingConverter,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure rating is between 0 and 10
    final clampedRating = rating.clamp(0, 10);

    // Put default colors if not provided
    final fill = fillColor ?? context.colors.primary;
    final empty = emptyColor ?? context.colors.surfaceContainerHighest;

    final ratingFinal = convertRating(clampedRating);
    final fullStars = ratingFinal.floor();
    final hasHalfStar = (ratingFinal - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < fullStars
              ? Icons.star_rounded
              : (index == fullStars && hasHalfStar)
              ? Icons.star_half_rounded
              : Icons.star_border_rounded,
          color: index < fullStars || (index == fullStars && hasHalfStar)
              ? fill
              : empty,
          size: size,
        );
      }),
    );
  }
}
