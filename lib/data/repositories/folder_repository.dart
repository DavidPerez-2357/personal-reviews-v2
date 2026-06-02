import 'package:personal_reviews/data/mappers/folder_mapper.dart';
import 'package:personal_reviews/database/daos/folders_dao.dart';
import 'package:personal_reviews/domain/models/folder.dart';
import 'package:personal_reviews/domain/models/folder_tree.dart';

class FolderRepository {
  final FoldersDao _foldersDao;

  FolderRepository(this._foldersDao);

  Future<List<FolderDomain>> getAll(bool isDeleted) {
    return _foldersDao
        .getAll(isDeleted)
        .then((folders) => FolderMapper.fromRows(folders));
  }

  Future<FolderDomain?> getById(int id) {
    return _foldersDao
        .getById(id)
        .then((folder) => folder != null ? FolderMapper.fromRow(folder) : null);
  }

  Future<List<FolderDomain>> getByCategoryId(int categoryId, bool isDeleted) {
    return _foldersDao
        .getByCategoryId(categoryId, isDeleted)
        .then((folders) => FolderMapper.fromRows(folders));
  }

  /* FOLDER TREE METHODS */
  Future<List<FolderNode>> getAllAsTree() {
    return _foldersDao
        .getAll(false)
        .then((folders) => FolderMapper.fromRows(folders))
        .then((folderDomains) => FolderNode.buildFolderTree(folderDomains));
  }

  Future<List<FolderNode>> getTreeByCategoryId(int categoryId) {
    return _foldersDao
        .getByCategoryId(categoryId, false)
        .then((folders) => FolderMapper.fromRows(folders))
        .then((folderDomains) => FolderNode.buildFolderTree(folderDomains));
  }

  // This is useful for when we want to display a folder and all its subfolders (and not parents)
  Future<FolderNode?> getFolderWithTreeById(int id) async {
    final folder = await _foldersDao.getById(id);
    if (folder == null) return null;

    final folderMap = await getTreeByCategoryId(folder.categoryId);

    for (var root in folderMap) {
      final found = root.findNodeById(id);
      if (found != null) {
        return found;
      }
    }

    return null;
  }

  Stream<List<FolderDomain>> watchAll(bool isDeleted) {
    return _foldersDao
        .watchAll(isDeleted)
        .map((folders) => FolderMapper.fromRows(folders));
  }

  Future<int> create({
    required String name,
    required int categoryId,
    int? parentId,
    String? imagePath,
  }) {
    return _foldersDao.create(
      name: name,
      categoryId: categoryId,
      parentId: parentId,
      imagePath: imagePath,
    );
  }

  Future<bool> updateById(
    int id, {
    required String name,
    required int categoryId,
    int? parentId,
    String? imagePath,
  }) {
    return _foldersDao.updateById(
      id,
      name: name,
      categoryId: categoryId,
      parentId: parentId,
      imagePath: imagePath,
    );
  }

  Future<bool> deleteById(int id) {
    return _foldersDao.setDeletedById(id, true);
  }

  Future<bool> restoreById(int id) {
    return _foldersDao.setDeletedById(id, false);
  }
}
