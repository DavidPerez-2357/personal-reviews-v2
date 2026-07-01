import 'package:personal_reviews/domain/explorer/explorer_state.dart';
import 'package:personal_reviews/data/repositories/folder_repository.dart';
import 'package:personal_reviews/data/repositories/item_repository.dart';
import 'package:personal_reviews/domain/explorer/explorer_transformer.dart';
import 'package:personal_reviews/providers/repositories_provider.dart';
import 'package:personal_reviews/core/types/folder_explorer.dart';
import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/domain/models/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class ExplorerNotifier extends StateNotifier<AsyncValue<ExplorerState>> {
  ExplorerNotifier({
    required this.folderRepository,
    required this.itemRepository,
    this.config = const FolderExplorerConfig(),
    this.data = const FolderExplorerData(),
  }) : super(const AsyncValue.loading()) {
    _load(
      sort: config.defaultSort,
      filter: config.defaultFilter,
      searchQuery: '',
      config: config,
      data: data,
    );
  }

  int _requestId = 0;

  final FolderExplorerConfig config;
  final FolderExplorerData data;

  final FolderRepository folderRepository;
  final ItemRepository itemRepository;

  Future<void> _load({
    required ElementsSort sort,
    required ElementsFilter filter,
    required String searchQuery,
    required FolderExplorerConfig config,
    required FolderExplorerData data,
  }) async {
    final requestId = ++_requestId;

    //state = const AsyncLoading();
    searchQuery = searchQuery.trim();

    try {
      if (!config.includeDeleted && config.excludeNonDeleted) {
        throw Exception(
          'Invalid configuration: includeDeleted is false and excludeNonDeleted is true',
        );
      }

      List<FolderDetailed> folders = [];

      if (filter.visibility != ElementsVisibility.itemsOnly &&
          config.groupByFolders &&
          !data.hasFolders) {
        folders = await folderRepository.queryDetailed(
          sort: sort,
          filter: filter,
          searchQuery: searchQuery,
          folderId: config.folderId,
          includeDeleted: config.includeDeleted,
          excludeNonDeleted: config.excludeNonDeleted,
        );
      }

      if (data.hasFolders) {
        folders = ExplorerTransformer.filterAndSortFolders(
          data.folders,
          filter,
          searchQuery,
          sort,
        );
      }

      List<ItemWithLastReview> items = [];

      if (filter.visibility != ElementsVisibility.foldersOnly &&
          !data.hasItems) {
        items = await itemRepository.queryItems(
          sort: sort,
          filter: filter,
          searchQuery: searchQuery,
          folderId: config.folderId,
          groupByFolders: config.groupByFolders,
          includeDeleted: config.includeDeleted,
          excludeNonDeleted: config.excludeNonDeleted,
        );
      }

      if (data.hasItems) {
        items = ExplorerTransformer.filterAndSortItems(
          data.items,
          filter,
          searchQuery,
          sort,
        );
      }

      // Guard against race conditions
      if (requestId != _requestId) {
        return;
      }

      state = AsyncData(
        ExplorerState(
          folders: folders,
          items: items,
          sort: sort,
          filter: filter,
          searchQuery: searchQuery,
        ),
      );
    } catch (e, st) {
      if (requestId != _requestId) {
        return;
      }

      state = AsyncError(e, st);
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
      data: data,
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
      data: data,
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
      data: data,
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
      data: data,
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
      data: data,
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
      data: data,
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
      data: data,
    );
  }
}

final explorerProvider =
    StateNotifierProvider.family<
      ExplorerNotifier,
      AsyncValue<ExplorerState>,
      FolderExplorerParams
    >((ref, params) {
      return ExplorerNotifier(
        folderRepository: ref.read(folderRepositoryProvider),
        itemRepository: ref.read(itemRepositoryProvider),
        config: params.config,
        data: params.data,
      );
    });
