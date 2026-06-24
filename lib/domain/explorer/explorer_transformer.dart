import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/core/types/sort.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/domain/models/item.dart';

class ExplorerTransformer {
  static List<FolderDetailedNode> filterFolders(
    List<FolderDetailedNode> folders,
    ElementsFilter filter,
    String searchQuery,
  ) {
    return folders.where((folder) {
      final matchesSearch =
          searchQuery.isEmpty ||
          folder.folder.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesVisibility =
          filter.visibility == ElementsVisibility.all ||
          (filter.visibility == ElementsVisibility.foldersOnly);
      return matchesSearch && matchesVisibility;
    }).toList();
  }

  static List<FolderDetailedNode> sortFolders(
    List<FolderDetailedNode> folders,
    ElementsSort sort,
  ) {
    List<FolderDetailedNode> sortedFolders = List.from(folders);
    sortedFolders.sort((a, b) {
      switch (sort.field) {
        case ElementsSortField.name:
          return a.folder.name.compareTo(b.folder.name);
        case ElementsSortField.date:
          return a.folder.createdAt.compareTo(b.folder.createdAt);
        default:
          return a.folder.id.compareTo(b.folder.id);
      }
    });
    if (sort.type == SortType.DESC) {
      sortedFolders = sortedFolders.reversed.toList();
    }
    return sortedFolders;
  }

  static List<ItemWithLastReview> filterItems(
    List<ItemWithLastReview> items,
    ElementsFilter filter,
    String searchQuery,
  ) {
    return items.where((item) {
      final matchesSearch =
          searchQuery.isEmpty ||
          item.item.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesVisibility =
          filter.visibility == ElementsVisibility.all ||
          (filter.visibility == ElementsVisibility.itemsOnly);

      if (filter.categoryIds.isNotEmpty) {
        if (!filter.categoryIds.contains(item.item.categoryId)) {
          return false;
        }
      }

      // min and max rating filters
      if (item.lastReview != null &&
          item.lastReview!.rating <= filter.minRating) {
        return false;
      }

      if (item.lastReview != null &&
          item.lastReview!.rating >= filter.maxRating) {
        return false;
      }

      return matchesSearch && matchesVisibility;
    }).toList();
  }

  static List<ItemWithLastReview> sortItems(
    List<ItemWithLastReview> items,
    ElementsSort sort,
  ) {
    List<ItemWithLastReview> sortedItems = List.from(items);
    sortedItems.sort((a, b) {
      switch (sort.field) {
        case ElementsSortField.name:
          return a.item.name.compareTo(b.item.name);
        case ElementsSortField.date:
          return a.item.createdAt.compareTo(b.item.createdAt);
        case ElementsSortField.rating:
          final aRating = a.lastReview?.rating ?? 0;
          final bRating = b.lastReview?.rating ?? 0;
          return aRating.compareTo(bRating);
        default:
          return a.item.id.compareTo(b.item.id);
      }
    });
    if (sort.type == SortType.DESC) {
      sortedItems = sortedItems.reversed.toList();
    }
    return sortedItems;
  }

  static List<FolderDetailedNode> filterAndSortFolders(
    List<FolderDetailedNode> folders,
    ElementsFilter filter,
    String searchQuery,
    ElementsSort sort,
  ) {
    final filteredFolders = filterFolders(folders, filter, searchQuery);
    final sortedFolders = sortFolders(filteredFolders, sort);
    return sortedFolders;
  }

  static List<ItemWithLastReview> filterAndSortItems(
    List<ItemWithLastReview> items,
    ElementsFilter filter,
    String searchQuery,
    ElementsSort sort,
  ) {
    final filteredItems = filterItems(items, filter, searchQuery);
    final sortedItems = sortItems(filteredItems, sort);
    return sortedItems;
  }
}
