import 'package:flutter/material.dart';
import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/data/mappers/folder_mapper.dart';
import 'package:personal_reviews/database/daos/folder_trees_dao.dart';
import 'package:personal_reviews/database/daos/folders_dao.dart';
import 'package:personal_reviews/domain/models/folder.dart';

class FolderRepository {
  final FoldersDao _foldersDao;
  final FolderTreesDao _folderTreesDao;

  FolderRepository(this._foldersDao, this._folderTreesDao);

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

  Future<int> create({required String name, int? parentId, String? imagePath}) {
    return _foldersDao.transaction(() async {
      final folderId = await _foldersDao.create(
        name: name,
        parentId: parentId,
        imagePath: imagePath,
      );
      await _folderTreesDao.insertFolderTree(folderId, parentId);
      return folderId;
    });
  }

  Future<bool> updateById(
    int id, {
    required String name,
    int? parentId,
    String? imagePath,
  }) {
    return _foldersDao.updateById(
      id,
      name: name,
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

  Future<List<FolderDetailed>> queryDetailed({
    required ElementsSort sort,
    required ElementsFilter filter,
    String searchQuery = '',
    int? folderId,
    bool includeDeleted = false,
    bool excludeNonDeleted = false,
  }) {
    debugPrint(
      'Querying detailed folders with sort: $sort, filter: $filter, searchQuery: "$searchQuery", folderId: $folderId, includeDeleted: $includeDeleted, excludeNonDeleted: $excludeNonDeleted',
    );
    return _foldersDao
        .queryFolders(
          sort: sort,
          filter: filter,
          searchQuery: searchQuery,
          folderId: folderId,
          includeDeleted: includeDeleted,
          excludeNonDeleted: excludeNonDeleted,
        )
        .then((folders) => FolderDetailedMapper.fromRows(folders));
  }
}
