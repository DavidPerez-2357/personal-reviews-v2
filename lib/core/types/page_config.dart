import 'package:flutter/material.dart';

class PageConfig {
  final String title;
  final Widget child;
  final bool scrollable;

  const PageConfig({
    required this.title,
    required this.child,
    this.scrollable = true,
  });
}
