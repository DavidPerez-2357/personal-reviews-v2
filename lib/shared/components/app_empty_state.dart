import 'package:flutter/material.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/style/design_system/app_radius.dart';
import 'package:personal_reviews/style/design_system/app_size.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';
import 'package:personal_reviews/style/theme/app_colors.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.maxWidth = 320,
    this.iconColor = AppColors.primary,
    this.iconBackgroundColor,
  });

  final IconData icon;
  final String title;
  final String message;
  final double maxWidth;
  final Color iconColor;
  final Color? iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        iconBackgroundColor ?? iconColor.withValues(alpha: 0.12);

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: AppRadius.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: AppSizes.infoIconContainerSize,
                height: AppSizes.infoIconContainerSize,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.rectangle,
                  borderRadius: AppRadius.lg,
                ),
                child: Icon(icon, size: AppSizes.xl, color: iconColor),
              ),
            ),

            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
