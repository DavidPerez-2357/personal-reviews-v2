import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/shared/components/rating_display.dart';
import 'package:personal_reviews/style/design_system/app_border.dart';
import 'package:personal_reviews/style/design_system/app_radius.dart';
import 'package:personal_reviews/style/design_system/app_size.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';
import 'package:flutter/material.dart';

class SkeletonItemCard extends StatelessWidget {
  const SkeletonItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

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
                    Container(
                      width: AppSizes.elementImageSize,
                      height: AppSizes.elementImageSize,
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.sm,
                        color: context.colors.surfaceContainerLow,
                      ),
                      child: Icon(
                        Icons.star_rounded,
                        color: context.colors.onSurfaceVariant.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),

                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: AppSizes.md,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: colors.surfaceContainer,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          RatingDisplay(
                            rating: 0,
                            size: AppSizes.ratingIconSize,
                            fillColor: context.colors.primary,
                            emptyColor: context.colors.surfaceContainerHighest,
                          ),
                        ],
                      ),
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
            child: Container(
              height: AppSizes.md,
              width: AppSizes.lg,
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: AppRadius.sm,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SkeletonFolderCard extends StatelessWidget {
  const SkeletonFolderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: AppRadius.md,
        color: colors.surfaceContainerLow,
        border: Border.all(color: colors.surfaceContainerHighest, width: 1),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.xl),
                child: Row(
                  children: [
                    Container(
                      width: AppSizes.elementImageSize,
                      height: AppSizes.elementImageSize,
                      decoration: BoxDecoration(
                        color: colors.onSurfaceVariant.withValues(alpha: 0.1),
                        borderRadius: AppRadius.sm,
                      ),
                      child: Icon(
                        Icons.folder_outlined,
                        color: colors.onSurfaceVariant.withValues(alpha: 0.5),
                      ),
                    ),

                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: AppSizes.md,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: colors.surfaceContainer,
                              borderRadius: AppRadius.sm,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Container(
                            height: AppSizes.sm,
                            width: AppSizes.skeletonWidthMd,
                            decoration: BoxDecoration(
                              color: colors.surfaceContainer,
                              borderRadius: AppRadius.sm,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.folder_outlined,
              size: AppSizes.elementIconSize,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
