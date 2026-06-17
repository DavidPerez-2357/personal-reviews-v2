import 'package:personal_reviews/core/types/folder_explorer.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/domain/models/item.dart';
import 'package:personal_reviews/features/folder_explorer/providers/folder_explorer_state.dart';
import 'package:personal_reviews/data/repositories/folder_repository.dart';
import 'package:personal_reviews/data/repositories/item_repository.dart';
import 'package:personal_reviews/providers/repositories_provider.dart';
import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class FolderExplorerNotifier
    extends StateNotifier<AsyncValue<FolderExplorerState>> {
  FolderExplorerNotifier({
    required this.folderRepository,
    required this.itemRepository,
    this.config = const FolderExplorerConfig(),
  }) : super(const AsyncValue.loading()) {
    _load(
      sort: config.defaultSort,
      filter: config.defaultFilter,
      searchQuery: '',
      config: config,
    );
  }

  final FolderExplorerConfig config;

  final FolderRepository folderRepository;
  final ItemRepository itemRepository;

  Future<void> _load({
    required ElementsSort sort,
    required ElementsFilter filter,
    required String searchQuery,
    required FolderExplorerConfig config,
  }) async {
    try {
      if (!config.includeDeleted && config.excludeNonDeleted) {
        throw Exception(
          'Invalid configuration: includeDeleted is false and excludeNonDeleted is true',
        );
      }

      final List<FolderDetailedNode> folders =
          filter.visibility != ElementsVisibility.itemsOnly &&
              config.groupByFolders
          ? await folderRepository.queryDetailedTree(
              sort: sort,
              filter: filter,
              searchQuery: searchQuery,
              folderId: config.folderId,
              includeDeleted: config.includeDeleted,
              excludeNonDeleted: config.excludeNonDeleted,
            )
          : [];

      final List<ItemWithLastReview> items =
          filter.visibility != ElementsVisibility.foldersOnly
          ? await itemRepository.queryItems(
              sort: sort,
              filter: filter,
              searchQuery: searchQuery,
              folderId: config.folderId,
              groupByFolders: config.groupByFolders,
              includeDeleted: config.includeDeleted,
              excludeNonDeleted: config.excludeNonDeleted,
            )
          : [];

      state = AsyncValue.data(
        FolderExplorerState(
          folders: folders,
          items: items,
          sort: sort,
          filter: filter,
          searchQuery: searchQuery,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> initialize({
    required ElementsSort sort,
    required ElementsFilter filter,
    required String searchQuery,
  }) async {
    await _load(
      sort: sort,
      filter: filter,
      searchQuery: searchQuery,
      config: config,
    );
  }

  Future<void> setSort(ElementsSort sort) async {
    final current = state.value;

    if (current == null) return;

    await _load(
      sort: sort,
      filter: current.filter,
      searchQuery: current.searchQuery,
      config: config,
    );
  }

  Future<void> setFilter(ElementsFilter filter) async {
    final current = state.value;

    if (current == null) return;

    await _load(
      sort: current.sort,
      filter: filter,
      searchQuery: current.searchQuery,
      config: config,
    );
  }

  Future<void> setSearchQuery(String searchQuery) async {
    final current = state.value;

    if (current == null) return;

    await _load(
      sort: current.sort,
      filter: current.filter,
      searchQuery: searchQuery,
      config: config,
    );
  }

  Future<void> resetFilters() async {
    final current = state.value;

    if (current == null) return;

    await _load(
      sort: current.sort,
      filter: config.defaultFilter,
      searchQuery: current.searchQuery,
      config: config,
    );
  }

  Future<void> resetSort() async {
    final current = state.value;

    if (current == null) return;

    await _load(
      sort: config.defaultSort,
      filter: current.filter,
      searchQuery: current.searchQuery,
      config: config,
    );
  }

  Future<void> refresh() async {
    final current = state.value;

    if (current == null) return;

    await _load(
      sort: current.sort,
      filter: current.filter,
      searchQuery: current.searchQuery,
      config: config,
    );
  }
}

final folderExplorerProvider =
    StateNotifierProvider.family<
      FolderExplorerNotifier,
      AsyncValue<FolderExplorerState>,
      FolderExplorerConfig
    >((ref, config) {
      return FolderExplorerNotifier(
        folderRepository: ref.read(folderRepositoryProvider),
        itemRepository: ref.read(itemRepositoryProvider),
        config: config,
      );
    });
