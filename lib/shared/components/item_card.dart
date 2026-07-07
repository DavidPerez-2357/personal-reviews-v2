import 'package:personal_reviews/shared/components/rating_display.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';
import 'package:personal_reviews/style/design_system/app_border.dart';
import 'package:personal_reviews/style/design_system/app_radius.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/style/design_system/app_size.dart';
import 'package:personal_reviews/core/extensions/datetime.dart';
import 'package:personal_reviews/domain/models/item.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Widget buildItemImage(ItemWithLastReview item, BuildContext context) {
  final imagePath = item.item.imagePath;

  // If the image path is empty and the folder doesn't have items with images
  if (imagePath == null || !File(imagePath).existsSync()) {
    return Container(
      width: AppSizes.elementImageSize,
      height: AppSizes.elementImageSize,
      decoration: BoxDecoration(
        borderRadius: AppRadius.sm,
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
    borderRadius: AppRadius.sm,
    child: Image.file(
      File(imagePath),
      width: AppSizes.elementImageSize,
      height: AppSizes.elementImageSize,
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
            borderRadius: AppRadius.md,
            border: Border.all(
              color: context.colors.surfaceContainerHighest,
              width: AppBorderWidth.sm,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.xl),
                child: Row(
                  children: [
                    buildItemImage(item, context),

                    const SizedBox(width: AppSpacing.md),
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
                        const SizedBox(height: AppSpacing.xs),
                        RatingDisplay(
                          rating: item.lastReview?.rating ?? 0,
                          size: AppSizes.ratingIconSize,
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
            padding: AppInsets.allSm,
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
