import 'package:flutter/material.dart';

enum MenuActionType { normal, destructive }

class MenuAction {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final MenuActionType type;
  final bool enabled;

  const MenuAction({
    required this.label,
    required this.onPressed,
    this.icon,
    this.type = MenuActionType.normal,
    this.enabled = true,
  });
}
