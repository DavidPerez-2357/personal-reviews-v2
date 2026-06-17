import 'package:personal_reviews/core/extensions/datetime.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/domain/models/item.dart';
import 'package:personal_reviews/shared/components/rating_display.dart';
import 'package:personal_reviews/style/theme/app_spacing.dart';
import 'package:personal_reviews/style/theme/app_border.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Widget buildItemImage(ItemWithLastReview item, BuildContext context) {
  final imagePath = item.item.imagePath;

  // If the image path is empty and the folder doesn't have items with images
  if (imagePath == null || !File(imagePath).existsSync()) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: AppRadius.smBorder,
        color: imagePath == null
            ? context.colors.surfaceContainerLow
            : context.colors.errorContainer.withValues(alpha: 0.07),
      ),
      child: Icon(
        imagePath == null ? Icons.star_rounded : Icons.broken_image,
        color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
      ),
    );
  }

  return ClipRRect(
    borderRadius: AppRadius.smBorder,
    child: Image.file(
      File(imagePath),
      width: 60,
      height: 60,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
    ),
  );
}

class ItemCard extends StatelessWidget {
  final ItemWithLastReview item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            borderRadius: AppRadius.mdBorder,
            border: Border.all(
              color: context.colors.surfaceContainerHighest,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Row(
                  children: [
                    buildItemImage(item, context),

                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.item.name,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RatingDisplay(
                          rating: item.lastReview?.rating ?? 0,
                          size: 18,
                          fillColor: context.colors.primary,
                          emptyColor: context.colors.surfaceContainerHighest,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              item.lastReview != null
                  ? item.lastReview!.createdAt.timeAgo(
                      format: TimeAgoFormat.short,
                    )
                  : '',
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
