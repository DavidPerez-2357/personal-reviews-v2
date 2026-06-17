import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/domain/models/item.dart';

part 'folder_explorer_state.freezed.dart';

@freezed
abstract class FolderExplorerState with _$FolderExplorerState {
  const factory FolderExplorerState({
    @Default([]) List<FolderDetailedNode> folders,
    @Default([]) List<ItemWithLastReview> items,
    @Default(ElementsSort()) ElementsSort sort,
    @Default(ElementsFilter()) ElementsFilter filter,
    @Default('') String searchQuery,
    @Default(false) bool isLoading,
  }) = _FolderExplorerState;
}
