import 'package:personal_reviews/core/data/models/item.dart';
import 'package:personal_reviews/core/database/app_database.dart';
import 'package:personal_reviews/core/datasources/category.dart';
import 'package:personal_reviews/core/datasources/folder.dart';
import 'package:personal_reviews/core/interfaces/datasource.dart';
import 'package:personal_reviews/core/interfaces/search_query.dart';
import 'package:personal_reviews/core/types/where_clause.dart';

class ItemDatasource
    implements
        BaseDataSource<ItemMin>,
        SoftDeletableDataSource<ItemMin>,
        SearchableDataSource<ItemMin> {
  static final CategoryDatasource _categoryDatasource = CategoryDatasource();
  static final FolderDatasource _folderDatasource = FolderDatasource();

  Future<ItemFull> convertToFull(ItemMin item) async {
    final category = await _categoryDatasource.getById(item.categoryId);
    final folder = item.folderId != null
        ? await _folderDatasource.getById(item.folderId!)
        : null;

    if (category == null) {
      throw Exception('Category with id ${item.categoryId} not found');
    }

    return ItemFull(
      id: item.id,
      name: item.name,
      imagePath: item.imagePath,
      createdAt: item.createdAt,
      updatedAt: item.updatedAt,
      category: category,
      folder: folder,
    );
  }

  Future<List<ItemFull>> convertToFullList(List<ItemMin> items) async {
    final categoryIds = items.map((e) => e.categoryId).toSet();

    final folderIds = items
        .where((e) => e.folderId != null)
        .map((e) => e.folderId!)
        .toSet();

    final categories = await _categoryDatasource.getByIds(categoryIds);
    final folders = await _folderDatasource.getByIds(folderIds);

    final categoryMap = {
      for (final category in categories) category.id: category,
    };

    final folderMap = {for (final folder in folders) folder.id: folder};

    return items.map((item) {
      return ItemFull(
        id: item.id,
        name: item.name,
        imagePath: item.imagePath,
        createdAt: item.createdAt,
        updatedAt: item.updatedAt,
        category: categoryMap[item.categoryId]!,
        folder: item.folderId != null ? folderMap[item.folderId!] : null,
      );
    }).toList();
  }

  /* BaseDataSource implementation */
  @override
  Future<List<ItemMin>> getAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('item');
        })
        .then((rows) {
          return rows.map((row) => ItemMin.fromJson(row)).toList();
        });
  }

  @override
  Future<int> countAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.rawQuery('SELECT COUNT(*) FROM item');
        })
        .then((rows) {
          return rows.first.values.first as int;
        });
  }

  @override
  Future<ItemMin?> getById(int id) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('item', where: 'id = ?', whereArgs: [id]);
        })
        .then((rows) {
          if (rows.isEmpty) {
            return null;
          }
          return ItemMin.fromJson(rows.first);
        });
  }

  @override
  Future<int> create(ItemMin item) {
    Map<String, dynamic> itemMap = item.toJson();

    // Remove id from the map since it will be auto-incremented by the database
    itemMap.remove('id');

    return AppDatabase.instance.database.then((db) {
      return db.insert('item', itemMap);
    });
  }

  @override
  Future<int> update(ItemMin item) {
    Map<String, dynamic> itemMap = item.toJson();

    // Remove id from the map since we don't want to update it
    itemMap.remove('id');

    return AppDatabase.instance.database.then((db) {
      return db.update('item', itemMap, where: 'id = ?', whereArgs: [item.id]);
    });
  }

  @override
  Future<int> delete(int id) {
    return AppDatabase.instance.database.then((db) {
      return db.delete('item', where: 'id = ?', whereArgs: [id]);
    });
  }

  /* SoftDeletableDataSource implementation */
  @override
  Future<List<ItemMin>> getAllByDeleted(bool deleted) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query(
            'item',
            where: 'deleted = ?',
            whereArgs: [deleted ? 1 : 0],
          );
        })
        .then((rows) {
          return rows.map((row) => ItemMin.fromJson(row)).toList();
        });
  }

  @override
  Future<int> countByDeleted(bool deleted) {
    return AppDatabase.instance.database
        .then((db) {
          return db.rawQuery('SELECT COUNT(*) FROM item WHERE deleted = ?', [
            deleted ? 1 : 0,
          ]);
        })
        .then((rows) {
          return rows.first.values.first as int;
        });
  }

  @override
  Future<ItemMin?> getExistingById(int id) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query(
            'item',
            where: 'id = ? AND deleted = 0',
            whereArgs: [id],
          );
        })
        .then((rows) {
          if (rows.isEmpty) {
            return null;
          }

          return ItemMin.fromJson(rows.first);
        });
  }

  @override
  Future<bool> isDeleted(int id) {
    return AppDatabase.instance.database.then((db) {
      return getExistingById(id).then((item) {
        return item == null;
      });
    });
  }

  @override
  Future<int> setDeleted(int id, bool deleted) {
    return AppDatabase.instance.database.then((db) {
      return db.update(
        'item',
        {'deleted': deleted ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  /* SearchableDataSource implementation */
  @override
  Future<List<ItemMin>> search(SearchQuery query) {
    return AppDatabase.instance.database
        .then((db) {
          WhereClause whereClause = query.buildWhereClause();

          return db.query(
            'item',
            where: whereClause.clause,
            whereArgs: whereClause.args,
            limit: query.limit,
            offset: query.offset,
          );
        })
        .then((rows) {
          return rows.map((row) => ItemMin.fromJson(row)).toList();
        });
  }

  /* Additional methods */
  Future<List<ItemMin>> getByIds(Set<int> itemIds) {
    return AppDatabase.instance.database
        .then((db) {
          String idsString = itemIds.join(', ');
          return db.rawQuery('SELECT * FROM item WHERE id IN ($idsString)');
        })
        .then((rows) {
          return rows.map((row) => ItemMin.fromJson(row)).toList();
        });
  }
}
