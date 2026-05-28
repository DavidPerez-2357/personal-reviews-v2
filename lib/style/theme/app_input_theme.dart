import 'package:flutter/material.dart';

import 'app_colors.dart';

final inputBorderRadius = BorderRadius.circular(5);

final appInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.surfaceContainer,

  border: OutlineInputBorder(borderRadius: inputBorderRadius),

  enabledBorder: OutlineInputBorder(
    borderRadius: inputBorderRadius,
    borderSide: BorderSide(color: AppColors.onSurface.withValues(alpha: 0.2)),
  ),

  focusedBorder: OutlineInputBorder(
    borderRadius: inputBorderRadius,
    borderSide: BorderSide(color: AppColors.onSurface.withValues(alpha: 0.4)),
  ),

  errorBorder: OutlineInputBorder(
    borderRadius: inputBorderRadius,
    borderSide: const BorderSide(color: AppColors.error),
  ),

  floatingLabelStyle: TextStyle(color: AppColors.onSurface),

  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
);

final appSearchBarTheme = SearchBarThemeData(
  backgroundColor: WidgetStatePropertyAll(AppColors.surfaceContainer),
  surfaceTintColor: WidgetStatePropertyAll(AppColors.surfaceContainer),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ),
  elevation: const WidgetStatePropertyAll(0),
);
