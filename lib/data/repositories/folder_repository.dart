import 'package:personal_reviews/data/mappers/folder_mapper.dart';
import 'package:personal_reviews/database/daos/folders_dao.dart';
import 'package:personal_reviews/domain/models/folder/folder.dart';

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
