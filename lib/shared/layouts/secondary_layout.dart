import 'package:flutter/material.dart';
import 'package:personal_reviews/core/types/menu_action.dart';
import 'package:personal_reviews/shared/widgets/menu_anchor/menu_anchor.dart';

class SecondaryLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool scrollable;
  final List<MenuAction> actions;
  const SecondaryLayout({
    super.key,
    required this.child,
    this.title,
    this.scrollable = true,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final Color onSurfaceColor = Theme.of(context).colorScheme.onSurface;
    final SafeArea body = SafeArea(
      child: Padding(padding: const EdgeInsets.all(24.0), child: child),
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          title ?? 'Secondary Layout',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: onSurfaceColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final navigator = Navigator.of(context);
            if (navigator.canPop()) {
              navigator.pop();
            } else {
              navigator.pushReplacementNamed('/');
            }
          },
        ),
        actions: actions.isNotEmpty ? [AppMenuAnchor(actions: actions)] : [],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: onSurfaceColor.withValues(alpha: 0.3),
          ),
        ),
      ),
      body: scrollable ? SingleChildScrollView(child: body) : body,
    );
  }
}
