import 'package:flutter/material.dart';
import 'package:personal_reviews/style/theme/app_border.dart';

class AppButtonStyles {
  static final WidgetStateProperty<OutlinedBorder> shape =
      WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
      );

  static const WidgetStateProperty<Size> minimumSize = WidgetStatePropertyAll(
    Size.fromHeight(52),
  );

  static const WidgetStateProperty<EdgeInsetsGeometry> padding =
      WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20));

  static ButtonStyle primary(ColorScheme colorScheme) {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
      foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
      minimumSize: minimumSize,
      padding: padding,
      shape: shape,
    );
  }

  static ButtonStyle outlined(ColorScheme colorScheme) {
    return ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
      side: WidgetStatePropertyAll(BorderSide(color: colorScheme.outline)),
      minimumSize: minimumSize,
      padding: padding,
      shape: shape,
    );
  }

  static ButtonStyle tonal(ColorScheme colorScheme) {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(colorScheme.secondaryContainer),
      foregroundColor: WidgetStatePropertyAll(colorScheme.onSecondaryContainer),
      minimumSize: minimumSize,
      padding: padding,
      shape: shape,
    );
  }

  static ButtonStyle icon(ColorScheme colorScheme) {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
      foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
      shape: shape,
      padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
    );
  }

  static ButtonStyle segmented(ColorScheme colorScheme) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.secondaryContainer;
        }

        return colorScheme.surfaceContainer;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.onSecondaryContainer;
        }

        return colorScheme.onSurface.withValues(alpha: 0.7);
      }),
      shape: shape,
    );
  }
}
