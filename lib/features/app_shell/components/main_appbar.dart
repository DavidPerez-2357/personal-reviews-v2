import 'package:flutter/material.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 45,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: context.colors.surface,
      foregroundColor: context.colors.primary,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: context.colors.primary,
          indent: 20.0,
          endIndent: 20.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45.0);
}
