import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
//import 'app_text_theme.dart';

final appTheme = ThemeData(
  useMaterial3: true,

  fontFamily: GoogleFonts.inter().fontFamily,

  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    surface: AppColors.surface,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onTertiary: AppColors.onTertiary,
    onSurface: AppColors.onSurface,
  ),

  scaffoldBackgroundColor: AppColors.surface,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onSurface,
    elevation: 0,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onSurface,
    ),
  ),
);