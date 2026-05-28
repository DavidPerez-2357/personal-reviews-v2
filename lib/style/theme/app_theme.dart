import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_button_theme.dart';
import 'app_input_theme.dart';
//import 'app_text_theme.dart';

final colorScheme = ColorScheme.dark(
  brightness: Brightness.dark,

  surface: AppColors.surface,
  surfaceContainer: AppColors.surfaceContainer,
  surfaceContainerLow: AppColors.surfaceContainerLow,
  surfaceContainerHigh: AppColors.surfaceContainerHigh,
  surfaceContainerHighest: AppColors.surfaceContainerHighest,

  primary: AppColors.primary,
  secondary: AppColors.secondary,
  tertiary: AppColors.tertiary,

  error: AppColors.error,

  onSurface: AppColors.onSurface,
  onPrimary: AppColors.onPrimary,
  onSecondary: AppColors.onSecondary,
  onTertiary: AppColors.onTertiary,
);

final appTheme = ThemeData(
  useMaterial3: true,

  fontFamily: GoogleFonts.inter().fontFamily,

  colorScheme: colorScheme,

  scaffoldBackgroundColor: AppColors.surface,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onSurface,
    elevation: 0,
  ),

  /* Input */
  inputDecorationTheme: appInputDecorationTheme,

  searchBarTheme: appSearchBarTheme,

  /* Buttons */
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: AppButtonStyles.primary(colorScheme),
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: AppButtonStyles.primary(colorScheme),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: AppButtonStyles.outlined(colorScheme),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
      padding: AppButtonStyles.padding,
      shape: AppButtonStyles.shape,
    ),
  ),

  segmentedButtonTheme: SegmentedButtonThemeData(
    style: AppButtonStyles.segmented(colorScheme),
  ),
);
