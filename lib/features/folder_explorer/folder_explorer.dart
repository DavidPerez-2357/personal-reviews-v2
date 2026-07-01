import 'package:personal_reviews/features/folder_explorer/components/elements_control.dart';
import 'package:personal_reviews/domain/explorer/explorer_data_provider.dart';
import 'package:personal_reviews/shared/components/app_empty_state.dart';
import 'package:personal_reviews/shared/components/skeleton_card.dart';
import 'package:personal_reviews/shared/components/folder_card.dart';
import 'package:personal_reviews/shared/components/item_card.dart';
import 'package:personal_reviews/core/types/folder_explorer.dart';
import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FolderExplorer extends ConsumerWidget {
  const FolderExplorer({
    super.key,
    this.folderPath = const [],
    this.config = const FolderExplorerConfig(),
    this.data = const FolderExplorerData(),
    this.onRefresh,
    this.emptyState,
  });

  final List<FolderDetailed> folderPath;
  final FolderExplorerConfig config;
  final FolderExplorerData data;
  final AppEmptyState? emptyState;
  final VoidCallback? onRefresh;

  FolderExplorerParams get params =>
      FolderExplorerParams(config: config, data: data);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveEmptyState = emptyState ?? buildEmptyState(config: config);

    final provider = explorerProvider(params);
    final explorer = ref.watch(provider);
    final notifier = ref.read(provider.notifier);

    Future<void> handleRefresh() {
      if (onRefresh != null) {
        return Future.sync(onRefresh!);
      }

      return notifier.refresh();
    }

    onFilterApplied(ElementsFilter newFilter) {
      notifier.setFilter(newFilter);
    }

    onSortApplied(ElementsSort newSort) {
      notifier.setSort(newSort);
    }

    bool areFiltersApplied(ElementsFilter filter) {
      return !filter.compare(config.defaultFilter);
    }

    bool searchQueryIsEmpty(String searchQuery) {
      return searchQuery.isEmpty;
    }

    return RefreshIndicator(
      onRefresh: () => handleRefresh(),
      child: explorer.when(
        loading: () => FolderExplorerSkeleton(config: config),

        error: (error, stackTrace) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: AppEmptyState(
                icon: Icons.error_outline_rounded,
                title: 'Error al cargar los elementos',
                message: 'Intenta recargar la página deslizando hacia abajo.',
              ),
            ),
          ],
        ),

        data: (state) {
          final isEmptyState = state.folders.isEmpty && state.items.isEmpty;

          final areAnyFiltersApplied =
              areFiltersApplied(state.filter) ||
              !searchQueryIsEmpty(state.searchQuery);

          if (isEmptyState && !areAnyFiltersApplied) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: effectiveEmptyState,
                ),
              ],
            );
          }

          return ExplorerList(
            hasAnyElements: state.folders.isNotEmpty || state.items.isNotEmpty,

            controls: ElementsControls(
              config: config,
              elementsFilter: state.filter,
              elementsSort: state.sort,

              onSearchChanged: (value) {
                ref
                    .read(explorerProvider(params).notifier)
                    .setSearchQuery(value);
              },

              onSortApplied: onSortApplied,
              onFilterApplied: onFilterApplied,
            ),

            children: [
              if (state.folders.isEmpty && state.items.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: buildEmptyStateWithFiltersApplied(
                    config: config,
                    filter: state.filter,
                    searchQuery: state.searchQuery,
                  ),
                ),

              ...state.folders.map(
                (folder) => Padding(
                  key: ValueKey('folder-${folder.folder.id}'),
                  padding: const EdgeInsets.only(bottom: 12),
                  child: FolderCard(folder: folder, folderPath: folderPath),
                ),
              ),

              ...state.items.map(
                (item) => Padding(
                  key: ValueKey('item-${item.item.id}'),
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ItemCard(item: item),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/* Build default empty state for the folder explorer, when no elements are found and no filters are applied */
AppEmptyState buildEmptyState({required FolderExplorerConfig config}) {
  return AppEmptyState(
    icon: Icons.star_rounded,
    title: config.groupByFolders
        ? 'Aún no hay elementos'
        : 'Aún no hay reseñas',
    message: config.groupByFolders
        ? 'Cuando se creen reseñas o carpetas, aparecerán aquí.'
        : 'Cuando se creen reseñas, aparecerán aquí.',
  );
}

/* Build empty state for the folder explorer, when no elements are found and filters are applied */
AppEmptyState buildEmptyStateWithFiltersApplied({
  required FolderExplorerConfig config,
  required ElementsFilter filter,
  required String searchQuery,
}) {
  searchQuery = searchQuery.trim();

  bool onlyFiltersApplied =
      filter.compare(config.defaultFilter) == false && searchQuery.isEmpty;

  String keyWordArticle = config.groupByFolders ? 'los' : 'las';
  String keyWord = config.groupByFolders ? 'elementos' : 'reseñas';

  return AppEmptyState(
    icon: onlyFiltersApplied ? Icons.filter_alt_rounded : Icons.search_rounded,
    title: 'No se encontraron $keyWord',
    message:
        'Intenta cambiar los filtros o restablecerlos para ver todos $keyWordArticle $keyWord',
  );
}

/* default structure of the folder explorer:
  - controls (search, sort, filter)
  - list of elements (folders and items) / Empty state if no elements are found
  */
class ExplorerList extends StatelessWidget {
  const ExplorerList({
    super.key,
    required this.controls,
    required this.children,
    this.hasAnyElements = true,
  });

  final Widget controls;
  final List<Widget> children;
  final bool hasAnyElements;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(padding: const EdgeInsets.only(bottom: 15), child: controls),
        ...children,

        if (hasAnyElements) const SizedBox(height: 60),
      ],
    );
  }
}

/* Skeleton state for the folder explorer, when loading elements */
class FolderExplorerSkeleton extends StatelessWidget {
  const FolderExplorerSkeleton({
    super.key,
    this.config = const FolderExplorerConfig(),
    this.folderCount = 2,
    this.itemCount = 4,
  });

  final FolderExplorerConfig config;
  final int folderCount;
  final int itemCount;

  // Debug the number of skeleton cards displayed
  void initState() {
    debugPrint(
      'FolderExplorerSkeleton: folderCount=$folderCount, itemCount=$itemCount',
    );
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return ExplorerList(
      controls: ElementsControls(
        isEnabled: false,
        config: config,
        elementsFilter: config.defaultFilter,
        elementsSort: config.defaultSort,
        onSearchChanged: (_) {},
        onSortApplied: (_) {},
        onFilterApplied: (_) {},
      ),
      children: [
        ...List.generate(
          folderCount,
          (_) => const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: SkeletonFolderCard(),
          ),
        ),

        ...List.generate(
          itemCount,
          (_) => const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: SkeletonItemCard(),
          ),
        ),
      ],
    );
  }
}
