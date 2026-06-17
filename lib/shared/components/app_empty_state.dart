import 'package:flutter/material.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/style/theme/app_border.dart';
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
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: AppRadius.mdBorder,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.rectangle,
                  borderRadius: AppRadius.lgBorder,
                ),
                child: Icon(icon, size: 32, color: iconColor),
              ),
            ),

            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
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
