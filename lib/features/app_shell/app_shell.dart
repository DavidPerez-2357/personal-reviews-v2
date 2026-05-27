import 'package:flutter/material.dart';
import 'package:personal_reviews/core/types/page_config.dart';
import 'package:personal_reviews/features/app_shell/components/main_appbar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int currentPageIndex = 1;

  late final List<PageConfig> pages = const [
    PageConfig(
      title: 'Resumen',
      child: Center(child: Text('Resumen')),
    ),
    PageConfig(
      title: 'Reseñas',
      child: Center(child: Text('Reseñas')),
    ),
    PageConfig(
      title: 'Ajustes',
      child: Center(child: Text('Ajustes')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPage = pages[currentPageIndex];
    final ThemeData theme = Theme.of(context);

    Widget body = SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: currentPage.child,
      ),
    );

    if (currentPage.scrollable) {
      body = SingleChildScrollView(child: body);
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,

      appBar: MainAppBar(title: currentPage.title),

      bottomNavigationBar: NavigationBar(
        // style
        indicatorColor: theme.colorScheme.primary.withValues(alpha: 0.24),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        maintainBottomViewPadding: false,
        labelTextStyle: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
          }
          return const TextStyle(fontSize: 12);
        }),

        // behavior
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.leaderboard, size: 30),
            selectedIcon: Icon(
              Icons.leaderboard,
              size: 30,
              color: theme.colorScheme.primary,
            ),
            label: 'Resumen',
          ),
          NavigationDestination(
            icon: const Icon(Icons.star_rounded, size: 33),
            selectedIcon: Icon(
              Icons.star_rounded,
              size: 33,
              color: theme.colorScheme.primary,
            ),
            label: 'Reseñas',
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings, size: 30),
            selectedIcon: Icon(
              Icons.settings,
              size: 30,
              color: theme.colorScheme.primary,
            ),
            label: 'Ajustes',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: pages.map((page) => page.child).toList(),
      ),
    );
  }
}
