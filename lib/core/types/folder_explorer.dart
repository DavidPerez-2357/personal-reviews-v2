import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';

class FolderExplorerConfig {
  /* DB Options */
  final bool groupByFolders;
  final int? folderId;
  final bool includeDeleted;
  final bool excludeNonDeleted;

  /* UI options */
  final bool showSearch;
  final bool showSort;
  final bool showFilter;
  final bool showCategoriesFilter;
  final bool showVisibilityFilter;

  /* Default filter and sort */
  final ElementsFilter defaultFilter;
  final ElementsSort defaultSort;

  const FolderExplorerConfig({
    this.groupByFolders = true,
    this.folderId,
    this.includeDeleted = false,
    this.excludeNonDeleted = false,
    this.showSearch = true,
    this.showSort = true,
    this.showFilter = true,
    this.showCategoriesFilter = true,
    this.showVisibilityFilter = true,
    this.defaultFilter = const ElementsFilter(),
    this.defaultSort = const ElementsSort(),
  });
}
