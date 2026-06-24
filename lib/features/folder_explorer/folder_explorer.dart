import 'package:personal_reviews/domain/explorer/explorer_data_provider.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/features/folder_explorer/components/elements_control.dart';
import 'package:personal_reviews/shared/components/app_empty_state.dart';
import 'package:personal_reviews/shared/components/folder_card.dart';
import 'package:personal_reviews/shared/components/item_card.dart';
import 'package:personal_reviews/core/types/folder_explorer.dart';
import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
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
    this.onDataLoaded,
  });

  final List<FolderDetailedNode> folderPath;
  final FolderExplorerConfig config;
  final FolderExplorerData data;
  final AppEmptyState? emptyState;
  final VoidCallback? onRefresh;
  final ValueChanged<FolderExplorerData>? onDataLoaded;

  FolderExplorerParams get params =>
      FolderExplorerParams(config: config, data: data);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveEmptyState = emptyState ?? buildEmptyState(config: config);

    final explorer = ref.watch(explorerProvider(params));

    Future<void> handleRefresh() {
      if (onRefresh != null) {
        return Future.sync(onRefresh!);
      }

      return ref.read(explorerProvider(params).notifier).refresh();
    }

    onFilterApplied(ElementsFilter newFilter) {
      ref.read(explorerProvider(params).notifier).setFilter(newFilter);
    }

    onSortApplied(ElementsSort newSort) {
      ref.read(explorerProvider(params).notifier).setSort(newSort);
    }

    bool areFiltersApplied(ElementsFilter filter) {
      return !filter.compare(config.defaultFilter);
    }

    bool searchQueryIsEmpty(String searchQuery) {
      return searchQuery.isEmpty;
    }

    return explorer.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (error, stackTrace) => Center(child: Text(error.toString())),

      data: (state) {
        final isEmptyState = state.folders.isEmpty && state.items.isEmpty;

        final areAnyFiltersApplied =
            areFiltersApplied(state.filter) ||
            !searchQueryIsEmpty(state.searchQuery);

        if (isEmptyState && !areAnyFiltersApplied) {
          return RefreshIndicator(
            onRefresh: () => handleRefresh(),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: effectiveEmptyState,
                ),
              ],
            ),
          );
        }

        if (onDataLoaded != null && !areAnyFiltersApplied) {
          onDataLoaded!(
            FolderExplorerData(
              hasFolders: config.groupByFolders,
              hasItems: true,
              folders: state.folders,
              items: state.items,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => handleRefresh(),
          child: ListView(
            children: [
              if (config.showSearch || config.showSort || config.showFilter)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ElementsControls(
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
                ),

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
                  padding: const EdgeInsets.only(bottom: 12),
                  child: FolderCard(folder: folder, folderPath: folderPath),
                ),
              ),

              ...state.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ItemCard(item: item),
                ),
              ),

              if (state.folders.isNotEmpty || state.items.isNotEmpty)
                const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}

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
