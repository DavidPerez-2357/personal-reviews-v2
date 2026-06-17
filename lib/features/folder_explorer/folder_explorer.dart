import 'package:personal_reviews/features/folder_explorer/providers/folder_explorer_provider.dart';
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
  // Build empty state base config
  const FolderExplorer({
    super.key,
    this.config = const FolderExplorerConfig(),
    this.emptyState,
  });

  final FolderExplorerConfig config;
  final AppEmptyState? emptyState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveEmptyState = emptyState ?? buildEmptyState(config: config);

    final explorer = ref.watch(folderExplorerProvider(config));

    onFilterApplied(ElementsFilter newFilter) {
      ref.read(folderExplorerProvider(config).notifier).setFilter(newFilter);
    }

    onSortApplied(ElementsSort newSort) {
      ref.read(folderExplorerProvider(config).notifier).setSort(newSort);
    }

    bool areFiltersApplied(ElementsFilter filter) {
      return filter.compare(config.defaultFilter) == false;
    }

    bool searchQueryIsEmpty(String searchQuery) {
      return searchQuery.isEmpty;
    }

    return explorer.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (error, stackTrace) => Center(child: Text(error.toString())),

      data: (state) {
        return state.folders.isEmpty &&
                state.items.isEmpty &&
                !areFiltersApplied(state.filter) &&
                searchQueryIsEmpty(state.searchQuery)
            ? ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: effectiveEmptyState,
                  ),
                ],
              )
            : ListView(
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
                              .read(folderExplorerProvider(config).notifier)
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
                      child: FolderCard(folder: folder),
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
