import 'package:personal_reviews/core/database/app_database.dart';
import 'package:personal_reviews/core/interfaces/datasource.dart';
import 'package:personal_reviews/core/data/models/category.dart';

class CategoryDatasource implements BaseDataSource<Category>, SoftDeletableDataSource<Category> {
  /* BaseDataSource implementation */
  @override
  Future<List<Category>> getAll() {
    return AppDatabase.instance.database.then((db) {
      return db.query('category');
    }).then((rows) {
      return rows.map((row) => Category.fromJson(row)).toList();
    });
  }

  @override
  Future<int> countAll() {
    return AppDatabase.instance.database.then((db) {
      return db.rawQuery('SELECT COUNT(*) FROM category');
    }).then((rows) {
      return rows.first.values.first as int;
    });
  }

  @override
  Future<Category?> getById(int id) {
    return AppDatabase.instance.database.then((db) {
      return db.query(
        'category',
        where: 'id = ?',
        whereArgs: [id],
      );
    }).then((rows) {
      if (rows.isEmpty) {
        return null;
      }
      return Category.fromJson(rows.first);
    });
  }

  @override
  Future<int> create(Category item) {
    Map<String, dynamic> itemMap = item.toJson();

    // Remove id from the map since it will be auto-incremented by the database
    itemMap.remove('id');

    return AppDatabase.instance.database.then((db) {
      return db.insert('category', itemMap);
    });
  }

  @override
  Future<int> update(Category item) {
    Map<String, dynamic> itemMap = item.toJson();

    // Remove id from the map since we don't want to update it
    itemMap.remove('id');

    return AppDatabase.instance.database.then((db) {
      return db.update(
        'category',
        itemMap,
        where: 'id = ?',
        whereArgs: [item.id],
      );
    });
  }

  @override
  Future<int> delete(int id) {
    return AppDatabase.instance.database.then((db) {
      return db.delete(
        'category',
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  
  /* SoftDeletableDataSource implementation */
  @override
  Future<List<Category>> getAllByDeleted(bool deleted) {
    return AppDatabase.instance.database.then((db) {
      return db.query(
        'category',
        where: 'deleted = ?',
        whereArgs: [deleted ? 1 : 0],
      );
    }).then((rows) {
      return rows.map((row) => Category.fromJson(row)).toList();
    });
  }

  @override
  Future<int> countByDeleted(bool deleted) {
    return AppDatabase.instance.database.then((db) {
      return db.rawQuery(
        'SELECT COUNT(*) FROM category WHERE deleted = ?',
        [deleted ? 1 : 0],
      );
    }).then((rows) {
      return rows.first.values.first as int;
    });
  }
  
  @override
  Future<Category?> getExistingById(int id) {
    return AppDatabase.instance.database.then((db) {
      return db.query(
        'category',
        where: 'id = ? AND deleted = 0',
        whereArgs: [id],
      );
    }).then((rows) {
      if (rows.isEmpty) {
        return null;
      }
      return Category.fromJson(rows.first);
    });
  }

  @override
  Future<bool> isDeleted(int id) {
    return getExistingById(id).then((category) => category == null);
  }

  @override
  Future<int> setDeleted(int id, bool deleted) {
    return AppDatabase.instance.database.then((db) {
      return db.update(
        'category',
        {'deleted': deleted ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  /* Additional methods */
  Future<List<Category>> getByIds(Set<int> categoryIds) async {
      return AppDatabase.instance.database.then((db) {
        String placeholders = List.filled(categoryIds.length, '?').join(', ');
        return db.query(
          'category',
          where: 'id IN ($placeholders)',
          whereArgs: categoryIds.toList(),
        );
      }).then((rows) {
        return rows.map((row) => Category.fromJson(row)).toList();
      });
  }
}