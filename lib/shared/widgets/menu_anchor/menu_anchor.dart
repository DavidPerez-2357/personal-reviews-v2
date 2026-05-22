import 'package:flutter/material.dart';
import 'package:personal_reviews/core/types/menu_action.dart';
import 'package:personal_reviews/shared/widgets/menu_anchor/menu_action_mapper.dart';

class AppMenuAnchor extends StatelessWidget {
  final List<MenuAction> actions;
  final Offset alignmentOffset;

  const AppMenuAnchor({
    super.key,
    required this.actions,
    this.alignmentOffset = const Offset(-10, 0),
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: alignmentOffset,
      consumeOutsideTap: true,
      animated: true,
      style: const MenuStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        ),
        visualDensity: VisualDensity.compact,
      ),
      builder: (context, controller, _) {
        return IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: controller.isOpen ? controller.close : controller.open,
        );
      },
      menuChildren: actions.map((a) => a.toMenuItem(context)).toList(),
    );
  }
}
