import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/core/types/folder_explorer.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/features/folder_items/folder_items.dart';
import 'package:personal_reviews/style/design_system/app_border.dart';
import 'package:personal_reviews/style/design_system/app_radius.dart';
import 'package:personal_reviews/style/design_system/app_size.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Widget buildFolderImage(FolderDetailed folder, BuildContext context) {
  final imagePath = folder.folder.imagePath;

  // If the image path is empty and the folder doesn't have items with images
  if (imagePath == null || !File(imagePath).existsSync()) {
    return Container(
      width: AppSizes.elementImageSize,
      height: AppSizes.elementImageSize,
      decoration: BoxDecoration(
        color: imagePath == null
            ? context.colors.onSurfaceVariant.withValues(alpha: 0.1)
            : context.colors.errorContainer.withValues(alpha: 0.07),
        borderRadius: AppRadius.sm,
      ),
      child: Icon(
        imagePath == null ? Icons.folder_outlined : Icons.broken_image,
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

class FolderCard extends StatelessWidget {
  final FolderDetailed folder;
  final FolderExplorerConfig folderExplorerConfig;
  final List<FolderDetailed> folderPath;

  const FolderCard({
    super.key,
    required this.folder,
    required this.folderExplorerConfig,
    required this.folderPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Go to the folder items page
        Navigator.push(
          context,
          MaterialPageRoute(
            settings: RouteSettings(name: 'folder_items/${folder.folder.id}'),
            builder: (context) => FolderItems(
              folder: folder,
              folderPath: [...folderPath, folder],
              config: folderExplorerConfig,
            ),
          ),
        );
      },
      child: Container(
        padding: AppInsets.allSm,
        decoration: BoxDecoration(
          borderRadius: AppRadius.md,
          color: context.colors.surfaceContainerLow,
          border: Border.all(
            color: context.colors.surfaceContainerHighest,
            width: AppBorderWidth.sm,
          ),
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
                      buildFolderImage(folder, context),

                      const SizedBox(width: AppSpacing.md),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            folder.folder.name,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${folder.itemCount} reseñas',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colors.onSurfaceVariant,
                            ),
                          ),
                        ],
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
      ),
    );
  }
}
