import 'package:flutter/material.dart';
import 'package:personal_reviews/core/types/page_config.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/features/app_shell/components/main_appbar.dart';
import 'package:personal_reviews/features/home/app_home.dart';
import 'package:personal_reviews/style/design_system/app_size.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int currentPageIndex = 1;

  late final List<PageConfig> pages = [
    PageConfig(
      title: 'Resumen',
      child: Center(child: Text('Resumen')),
    ),
    PageConfig(title: 'Reseñas', child: AppHomeGroups(), scrollable: false),
    PageConfig(
      title: 'Ajustes',
      child: Center(child: Text('Ajustes')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPage = pages[currentPageIndex];

    Widget body = SafeArea(
      child: Padding(padding: AppInsets.pageInsets, child: currentPage.child),
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
        indicatorColor: context.colors.primary.withValues(alpha: 0.24),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        maintainBottomViewPadding: false,
        labelTextStyle: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            );
          }
          return context.textTheme.bodySmall;
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
            icon: const Icon(
              Icons.leaderboard,
              size: AppSizes.mainNavigationIconSize,
            ),
            selectedIcon: Icon(
              Icons.leaderboard,
              size: AppSizes.mainNavigationIconSize,
              color: context.colors.primary,
            ),
            label: 'Resumen',
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.star_rounded,
              size: AppSizes.mainNavigationIconSize,
            ),
            selectedIcon: Icon(
              Icons.star_rounded,
              size: AppSizes.mainNavigationIconSize,
              color: context.colors.primary,
            ),
            label: 'Reseñas',
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.settings,
              size: AppSizes.mainNavigationIconSize,
            ),
            selectedIcon: Icon(
              Icons.settings,
              size: AppSizes.mainNavigationIconSize,
              color: context.colors.primary,
            ),
            label: 'Ajustes',
          ),
        ],
      ),
      body: body,
    );
  }
}
