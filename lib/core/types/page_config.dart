import 'package:flutter/material.dart';

class PageConfig {
  final String title;
  final Widget child;
  final List<Widget>? actions;
  final bool scrollable;

  const PageConfig({
    required this.title,
    required this.child,
    this.actions,
    this.scrollable = true,
  });
}
