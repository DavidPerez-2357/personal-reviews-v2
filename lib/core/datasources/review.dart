import 'package:personal_reviews/core/data/models/review.dart';
import 'package:personal_reviews/core/database/app_database.dart';
import 'package:personal_reviews/core/datasources/item.dart';
import 'package:personal_reviews/core/datasources/review_image.dart';
import 'package:personal_reviews/core/interfaces/datasource.dart';

class ReviewDatasource implements BaseDataSource<ReviewMin> {
  static final ItemDatasource _itemDatasource = ItemDatasource();
  static final ReviewImageDatasource _reviewImageDatasource =
      ReviewImageDatasource();

  /* Helper methods */
  Future<ReviewFull> convertToFull(ReviewMin review) async {
    final item = await _itemDatasource.getById(review.itemId);
    final images = await _reviewImageDatasource.getByReviewId(review.id);

    if (item == null) {
      throw Exception('Item with id ${review.itemId} not found');
    }

    return ReviewFull(
      id: review.id,
      comment: review.comment,
      rating: review.rating,
      createdAt: review.createdAt,
      updatedAt: review.updatedAt,
      item: item,
      images: images,
    );
  }

  Future<List<ReviewFull>> convertToFullList(List<ReviewMin> reviews) async {
    final itemIds = reviews.map((e) => e.itemId).toSet();
    final reviewsIds = reviews.map((e) => e.id).toSet();
    
    final items = await _itemDatasource.getByIds(itemIds);
    final images = await _reviewImageDatasource.getByReviewIds(reviewsIds);

    final itemMap = {
      for (final item in items) item.id: item,
    };

    return reviews.map((review) {
      return ReviewFull(
        id: review.id,
        comment: review.comment,
        rating: review.rating,
        createdAt: review.createdAt,
        updatedAt: review.updatedAt,
        item: itemMap[review.itemId]!,
        images: images[review.id] ?? [],
      );
    }).toList();
  }

  /* BaseDataSource implementation */
  @override
  Future<List<ReviewMin>> getAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('review');
        })
        .then((rows) {
          return rows.map((row) => ReviewMin.fromJson(row)).toList();
        });
  }

  @override
  Future<int> countAll() {
    return AppDatabase.instance.database
        .then((db) {
          return db.rawQuery('SELECT COUNT(*) FROM review');
        })
        .then((rows) {
          return rows.first.values.first as int;
        });
  }

  @override
  Future<ReviewMin?> getById(int id) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query('review', where: 'id = ?', whereArgs: [id]);
        })
        .then((rows) {
          if (rows.isEmpty) {
            return null;
          }

          return ReviewMin.fromJson(rows.first);
        });
  }

  Future<List<ReviewMin>> getByItemId(int itemId) {
    return AppDatabase.instance.database
        .then((db) {
          return db.query(
            'review',
            where: 'item_id = ? and deleted = 0',
            whereArgs: [itemId],
          );
        })
        .then((rows) {
          return rows.map((row) => ReviewMin.fromJson(row)).toList();
        });
  }

  @override
  Future<int> create(ReviewMin item) {
    return AppDatabase.instance.database.then((db) {
      return db.insert('review', item.toJson());
    });
  }

  @override
  Future<int> update(ReviewMin item) {
    return AppDatabase.instance.database.then((db) {
      return db.update(
        'review',
        item.toJson(),
        where: 'id = ?',
        whereArgs: [item.id],
      );
    });
  }

  @override
  Future<int> delete(int id) {
    return AppDatabase.instance.database.then((db) {
      return db.delete('review', where: 'id = ?', whereArgs: [id]);
    });
  }
}
