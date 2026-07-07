import 'package:personal_reviews/core/constants/category_icons.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/domain/models/category.dart';
import 'package:personal_reviews/style/design_system/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:personal_reviews/style/design_system/app_size.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';

class CategoryCard extends StatelessWidget {
  final CategoryWithStats category;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color color = category.category.color.toColor();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
      elevation: 0,
      color: color.withValues(alpha: 0.1),
      clipBehavior: Clip.antiAlias,

      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.nm,
            AppSpacing.nm,
            AppSpacing.nm,
            AppSpacing.nm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* Icon with colored background */
              Container(
                padding: AppInsets.allSm,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: AppRadius.md,
                ),
                child: Icon(
                  presetCategories[category.category.icon]?.icon ??
                      Icons.category_outlined,
                  color: Colors.white,
                  size: AppSizes.lg,
                ),
              ),

              /* Category name and review count */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (category.category.name.isNotEmpty)
                        ? category.category.name
                        : 'Categoría sin nombre',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),

                  const SizedBox(height: AppSpacing.xs),

                  Text(
                    '${category.itemCount} reseñas',
                    style: context.textTheme.bodySmall?.copyWith(color: color),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
