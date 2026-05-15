import 'package:personal_reviews/core/data/models/folder.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/core/datasources/category.dart';
import 'package:personal_reviews/core/interfaces/datasource.dart';

class FolderDatasource
    implements BaseDataSource<FolderMin>, SoftDeletableDataSource<FolderMin> {

  static final CategoryDatasource _categoryDatasource = CategoryDatasource();

  Future<FolderFull> _getFolderWithParents(int id) async {
    final folder = await getById(id);

    if (folder == null) {
      throw Exception('Folder with id $id not found');
    }

    final parent = folder.parentId == null
        ? null
        : await _getFolderWithParents(folder.parentId!);

    final category = await _categoryDatasource.getById(folder.categoryId);
    if (category == null) {
      throw Exception('Category with id ${folder.categoryId} not found');
    }

    return FolderFull(
      id: folder.id,
      name: folder.name,
      imagePath: folder.imagePath,
      parent: parent,
      category: category,
    );
  }

  /* Helper methods */
  Future<FolderFull> convertToFull(FolderMin min) async {
    final parent = min.parentId == null
        ? null
        : await _getFolderWithParents(min.parentId!);

    final category = await _categoryDatasource.getById(min.categoryId);
    if (category == null) {
      throw Exception('Category with id ${min.categoryId} not found');
    }

    return FolderFull(
      id: min.id,
      name: min.name,
      imagePath: min.imagePath,
      parent: parent,
      category: category,
    );
  }

  Future<List<FolderFull>> convertToFullList(List<FolderMin> mins) {
    return Future.wait(mins.where((min) => min.parentId == null).map((min) => convertToFull(min)).toList());
  }

  /* BaseDataSource implementation */
  @override
  Future<List<FolderMin>> getAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('folder', where: 'parent_id IS NULL');
        })
        .then((rows) {
          return rows.map((row) => FolderMin.fromJson(row)).toList();
        });
  }

  @override
  Future<int> countAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.rawQuery('SELECT COUNT(*) FROM folder');
        })
        .then((rows) {
          return rows.first.values.first as int;
        });
  }

  @override
  Future<FolderMin?> getById(int id) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('folder', where: 'id = ?', whereArgs: [id]);
        })
        .then((rows) {
          if (rows.isEmpty) {
            return null;
          }
          return FolderMin.fromJson(rows.first);
        });
  }

  @override
  Future<int> create(FolderMin item) {
    return AppDatabase.instance.database.then((db) {
      return db.insert('folder', item.toJson());
    });
  }

  @override
  Future<int> update(FolderMin item) {
    return AppDatabase.instance.database.then((db) {
      return db.update(
        'folder',
        item.toJson(),
        where: 'id = ?',
        whereArgs: [item.id],
      );
    });
  }

  @override
  Future<int> delete(int id) {
    return AppDatabase.instance.database.then((db) {
      return db.delete('folder', where: 'id = ?', whereArgs: [id]);
    });
  }

  /* SoftDeletableDataSource implementation */
  @override
  Future<List<FolderMin>> getAllByDeleted(bool deleted) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query(
            'folder',
            where: 'deleted = ?',
            whereArgs: [deleted ? 1 : 0],
          );
        })
        .then((rows) {
          return rows.map((row) => FolderMin.fromJson(row)).toList();
        });
  }

  @override
  Future<int> countByDeleted(bool deleted) {
    return AppDatabase.instance.database
        .then((db) {
          return db.rawQuery('SELECT COUNT(*) FROM folder WHERE deleted = ?', [
            deleted ? 1 : 0,
          ]);
        })
        .then((rows) {
          return rows.first.values.first as int;
        });
  }

  @override
  Future<FolderMin?> getExistingById(int id) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query(
            'folder',
            where: 'id = ? AND deleted = 0',
            whereArgs: [id],
          );
        })
        .then((rows) {
          if (rows.isEmpty) {
            return null;
          }
          return FolderMin.fromJson(rows.first);
        });
  }

  @override
  Future<bool> isDeleted(int id) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query(
            'folder',
            where: 'id = ? AND deleted = 1',
            whereArgs: [id],
          );
        })
        .then((rows) => rows.isNotEmpty);
  }

  @override
  Future<int> setDeleted(int id, bool deleted) {
    return AppDatabase.instance.database.then((db) {
      return db.update(
        'folder',
        {'deleted': deleted ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  /* Additional methods */
  Future<List<FolderMin>> getByIds(Set<int> folderIds) async {
      return AppDatabase.instance.database.then((db) {
        String idsString = folderIds.join(', ');
        return db.rawQuery('SELECT * FROM folder WHERE id IN ($idsString)');
      }).then((rows) {
        return rows.map((row) => FolderMin.fromJson(row)).toList();
      });
  }
}
