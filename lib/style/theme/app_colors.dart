import 'package:flutter/material.dart';

abstract final class AppColors {
  static const surface = Color(0xFF20262F); // background
  static const surfaceContainer = Color(0xFF20262F); // inputs/cards
  static const surfaceContainerHigh = Color(0xFF20262F); // dialogs

  static const primary = Color(0xFF1E8E93);
  static const secondary = Color(0xFF056244);
  static const tertiary = Color(0xFF0051A1);

  static const success = Color(0xFF16A34A);
  static const error = Color(0xFFDC2626);
  static const warning = Color(0xFFF59E0B);

  static const onSurface = Color(0xFFE5E7EB);

  static const onPrimary = onSurface;
  static const onSecondary = onSurface;
  static const onTertiary = onSurface;
}
