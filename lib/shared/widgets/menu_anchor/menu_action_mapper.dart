import 'package:flutter/material.dart';
import 'package:personal_reviews/core/types/menu_action.dart';

extension AppMenuActionMapper on MenuAction {
  MenuItemButton toMenuItem(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final color = type == MenuActionType.destructive
        ? colorScheme.error
        : colorScheme.onSurface;

    return MenuItemButton(
      onPressed: enabled ? onPressed : null,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 15, color: color),
                const SizedBox(width: 12),
                Text(label, style: TextStyle(color: color)),
              ],
            )
          : Text(
              label,
              style: TextStyle(
                color: color.withValues(alpha: enabled ? 1.0 : 0.5),
              ),
            ),
    );
  }
}
