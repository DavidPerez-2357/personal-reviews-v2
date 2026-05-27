import 'package:flutter/material.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/core/types/menu_action.dart';

extension AppMenuActionMapper on MenuAction {
  MenuItemButton toMenuItem(BuildContext context) {
    final Color baseColor = type == MenuActionType.destructive
        ? context.colors.error
        : context.colors.onSurface;

    final Color effectiveColor = enabled
        ? baseColor
        : baseColor.withValues(alpha: 0.5);

    return MenuItemButton(
      onPressed: enabled ? onPressed : null,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 15, color: effectiveColor),
                const SizedBox(width: 12),
                Text(label, style: TextStyle(color: effectiveColor)),
              ],
            )
          : Text(label, style: TextStyle(color: effectiveColor)),
    );
  }
}
