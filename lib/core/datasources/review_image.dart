import 'package:personal_reviews/core/data/models/review.dart';
import 'package:personal_reviews/core/database/app_database.dart';
import 'package:personal_reviews/core/interfaces/datasource.dart';

class ReviewImageDatasource implements BaseDataSource<ReviewImage> {
  @override
  Future<List<ReviewImage>> getAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('review_image');
        })
        .then((rows) {
          return rows.map((row) => ReviewImage.fromJson(row)).toList();
        });
  }

  @override
  Future<int> countAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.rawQuery('SELECT COUNT(*) FROM review_image');
        })
        .then((rows) {
          return rows.first.values.first as int;
        });
  }

  @override
  Future<ReviewImage?> getById(int id) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('review_image', where: 'id = ?', whereArgs: [id]);
        })
        .then((rows) {
          if (rows.isEmpty) {
            return null;
          }
          return ReviewImage.fromJson(rows.first);
        });
  }

  @override
  Future<int> create(ReviewImage item) {
    Map<String, dynamic> itemMap = item.toJson();

    // Remove id from the map since it will be auto-incremented by the database
    itemMap.remove('id');

    return AppDatabase.instance.database.then((db) {
      return db.insert('review_image', itemMap);
    });
  }

  @override
  Future<int> update(ReviewImage item) {
    Map<String, dynamic> itemMap = item.toJson();

    // Remove id from the map since we don't want to update it
    itemMap.remove('id');

    return AppDatabase.instance.database.then((db) {
      return db.update(
        'review_image',
        itemMap,
        where: 'id = ?',
        whereArgs: [item.id],
      );
    });
  }

  @override
  /// @PRE: The image was deleted from the file system before calling this method
  Future<int> delete(int id) {
    return AppDatabase.instance.database.then((db) {
      return db.delete('review_image', where: 'id = ?', whereArgs: [id]);
    });
  }

  /* Additional methods */
  Future<List<ReviewImage>> getByReviewId(int reviewId) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query(
            'review_image',
            where: 'review_id = ?',
            whereArgs: [reviewId],
          );
        })
        .then((rows) {
          return rows.map((row) => ReviewImage.fromJson(row)).toList();
        });
  }

  Future<Map<int, List<ReviewImage>>> getByReviewIds(Set<int> reviewIds) {
    return AppDatabase.instance.database
        .then((db) {
          String idsString = reviewIds.join(', ');
          return db.rawQuery(
            'SELECT * FROM review_image WHERE review_id IN ($idsString)',
          );
        })
        .then((rows) {
          Map<int, List<ReviewImage>> imagesByReviewId = {};
          for (var row in rows) {
            ReviewImage image = ReviewImage.fromJson(row);
            imagesByReviewId.putIfAbsent(row['review_id'] as int, () => []).add(image);
          }
          return imagesByReviewId;
        });
  }
}
