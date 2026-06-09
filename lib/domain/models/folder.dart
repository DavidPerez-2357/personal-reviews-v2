import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_reviews/domain/models/item.dart';

part 'folder.freezed.dart';

@freezed
abstract class FolderDomain with _$FolderDomain {
  const factory FolderDomain({
    required int id,
    required String name,
    String? imagePath,
    int? parentId,
    required int categoryId,
    required DateTime createdAt,

    @Default(false) bool isDeleted,
    DateTime? deletedAt,
  }) = _FolderDomain;
}

@freezed
abstract class FolderDetailed with _$FolderDetailed {
  const factory FolderDetailed({
    required FolderDomain folder,
    required int itemCount,
    required List<String> previewImages,
  }) = _FolderDetailed;
}

/* Folder trees */
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

@freezed
abstract class FolderDetailedNode with _$FolderDetailedNode {
  const FolderDetailedNode._();

  const factory FolderDetailedNode({
    required FolderDomain folder,
    @Default(0) int itemCount,
    @Default([]) List<String> previewImages,
    @Default([]) List<FolderDetailedNode> children,
  }) = _FolderDetailedNode;

  static List<FolderDetailedNode> buildFolderTree(
    List<FolderDetailed> folders,
  ) {
    final childrenByParent = <int?, List<FolderDetailed>>{};

    for (final folder in folders) {
      childrenByParent.putIfAbsent(folder.folder.parentId, () => []);
      childrenByParent[folder.folder.parentId]!.add(folder);
    }

    List<FolderDetailedNode> buildNodes(int? parentId) {
      final children = childrenByParent[parentId] ?? [];

      return children.map((folder) {
        return FolderDetailedNode(
          folder: folder.folder,
          itemCount: folder.itemCount,
          previewImages: folder.previewImages,
          children: buildNodes(folder.folder.id),
        );
      }).toList();
    }

    return buildNodes(null);
  }

  List<int> getAllFolderIds() {
    final ids = <int>[folder.id];

    for (final child in children) {
      ids.addAll(child.getAllFolderIds());
    }

    return ids;
  }

  FolderDetailedNode? findNodeById(int folderId) {
    if (folder.id == folderId) {
      return this;
    }

    for (final child in children) {
      final found = child.findNodeById(folderId);

      if (found != null) {
        return found;
      }
    }

    return null;
  }

  int get totalItemCount {
    return itemCount +
        children.fold(0, (sum, child) => sum + child.totalItemCount);
  }

  List<String> get allPreviewImages {
    final images = <String>[...previewImages];

    for (final child in children) {
      images.addAll(child.allPreviewImages);
    }

    return images;
  }
}

/* Folder content */
@freezed
abstract class FolderContent with _$FolderContent {
  const factory FolderContent({
    @Default([]) List<FolderDetailedNode> folders,
    @Default([]) List<ItemWithLastReview> items,
  }) = _FolderContent;
}
