import 'package:personal_reviews/features/home/pages/view_all_categories.dart';
import 'package:personal_reviews/features/folder_explorer/folder_explorer.dart';
import 'package:personal_reviews/core/types/folder_explorer.dart';
import 'package:flutter/material.dart';

class AppHomeGroups extends StatefulWidget {
  const AppHomeGroups({super.key});

  @override
  State<AppHomeGroups> createState() => _AppHomeGroupsState();
}

class _AppHomeGroupsState extends State<AppHomeGroups> {
  static const int _virtualPageCount = 1000000;
  final int _initialPage = (_virtualPageCount ~/ 2) - 2;

  late final PageController _controller = PageController(
    initialPage: _initialPage,
  );

  final Map<String, Widget> _pages = {
    'Agrupar por categorías': const ViewAllCategories(),
    'Agrupar por carpetas': const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: FolderExplorer(),
    ),
    'No agrupar': const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: FolderExplorer(
        config: FolderExplorerConfig(groupByFolders: false),
      ),
    ),
  };

  late int _currentPage = _initialPage;

  int get _realIndex => _currentPage % _pages.length;

  void _nextPage() {
    FocusManager.instance.primaryFocus?.unfocus();
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    FocusManager.instance.primaryFocus?.unfocus();
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(
          title: _pages.keys.elementAt(_realIndex),
          onPrevious: _previousPage,
          onNext: _nextPage,
        ),

        Expanded(
          child: PageView.builder(
            controller: _controller,
            physics: const PageScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              final realIndex = index % _pages.length;

              return _pages.values.elementAt(realIndex);
            },
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _Header({
    required this.title,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          IconButton(
            onPressed: onPrevious,
            icon: const Icon(Icons.chevron_left),
          ),

          Expanded(
            child: Center(
              child: Text(title, style: const TextStyle(fontSize: 14)),
            ),
          ),

          IconButton(onPressed: onNext, icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }
}
