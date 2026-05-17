import 'package:personal_reviews/domain/models/folder/folder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_tree.freezed.dart';

@freezed
abstract class FolderNode with _$FolderNode {
  const FolderNode._();

  const factory FolderNode({
    required int id,
    required String name,
    required int categoryId,
    String? imagePath,
    required DateTime createdAt,
    required bool isDeleted,
    DateTime? deletedAt,
    int? parentId,
    @Default([]) List<FolderNode> children,
  }) = _FolderNode;

  static List<FolderNode> buildFolderTree(List<FolderDomain> folders) {
    final Map<int, FolderNode> folderMap = {
      for (var folder in folders)
        folder.id: FolderNode(
          id: folder.id,
          name: folder.name,
          categoryId: folder.categoryId,
          imagePath: folder.imagePath,
          createdAt: folder.createdAt,
          isDeleted: folder.isDeleted,
          deletedAt: folder.deletedAt,
          parentId: folder.parentId,
        ),
    };

    final List<FolderNode> rootFolders = [];

    for (var folder in folderMap.values) {
      if (folder.parentId != null) {
        final parent = folderMap[folder.parentId!];
        if (parent != null) {
          parent.children.add(folder);
        }
      } else {
        rootFolders.add(folder);
      }
    }

    return rootFolders;
  }

  FolderNode? findNodeById(int id) {
    if (this.id == id) {
      return this;
    }

    for (var child in children) {
      final found = child.findNodeById(id);

      if (found != null) {
        return found;
      }
    }

    return null;
  }
}
