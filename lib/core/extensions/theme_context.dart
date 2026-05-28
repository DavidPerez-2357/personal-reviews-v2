import 'package:flutter/material.dart';
import 'package:personal_reviews/style/theme/app_border.dart';
import 'package:personal_reviews/style/theme/app_spacing.dart';

extension ThemeContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
  AppSpacing get spacing => AppSpacing();
  AppRadius get radius => AppRadius();
}
