import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool scrollable;
  const MainLayout({
    super.key,
    required this.child,
    this.title,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final SafeArea body = SafeArea(
      child: Padding(padding: const EdgeInsets.all(24.0), child: child),
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        title: Text(
          title ?? 'Main Layout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: primaryColor,
            indent: 20.0,
            endIndent: 20.0,
          ),
        ),
      ),
      body: scrollable ? SingleChildScrollView(child: body) : body,
    );
  }
}
