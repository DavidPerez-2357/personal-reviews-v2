import 'package:personal_reviews/data/mappers/item_mapper.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/database/daos/categories_dao.dart';
import 'package:personal_reviews/database/daos/folders_dao.dart';
import 'package:personal_reviews/database/daos/items_dao.dart';
import 'package:personal_reviews/database/daos/review_images_dao.dart';
import 'package:personal_reviews/database/daos/reviews_dao.dart';
import 'package:personal_reviews/domain/models/item.dart';

class ItemRepository {
  final ItemsDao _itemsDao;
  final CategoriesDao _categoriesDao;
  final FoldersDao _foldersDao;
  final ReviewsDao _reviewsDao;
  final ReviewImagesDao _reviewImagesDao;

  ItemRepository(
    this._itemsDao,
    this._categoriesDao,
    this._foldersDao,
    this._reviewsDao,
    this._reviewImagesDao,
  );

  Future<List<ItemDomain>> _convertListToDomain(
    List<Item> items,
    bool includeFolders,
    bool includeReviews,
  ) async {
    List<Category> categories = [];
    List<Folder>? folders;
    List<Review>? reviews;
    List<ReviewImage>? reviewImages;

    final itemIds = items.map((item) => item.id).toList();

    categories = await _categoriesDao.getAll(false);

    if (includeFolders) {
      folders = await _foldersDao.getByItemIds(itemIds);
    }

    if (includeReviews) {
      reviews = await _reviewsDao.getByItemIds(itemIds);
      final reviewIds = reviews.map((review) => review.id).toList();
      reviewImages = await _reviewImagesDao.getByReviewIds(reviewIds);
    }

    return ItemMapper.fromRows(
      items,
      categories,
      folders,
      reviews,
      reviewImages,
    );
  }

  Future<List<ItemDomain>> getAll(bool isDeleted) async {
    return _itemsDao
        .getAll(isDeleted)
        .then((items) => _convertListToDomain(items, false, false));
  }

  Future<ItemDomain?> getById(int id) async {
    final item = await _itemsDao.getById(id);
    if (item == null) return null;

    final items = await _convertListToDomain([item], true, true);
    return items.isNotEmpty ? items.first : null;
  }

  Future<int> insert({
    required String name,
    required int categoryId,
    int? folderId,
    String? imagePath,
  }) {
    return _itemsDao.create(
      name: name,
      categoryId: categoryId,
      folderId: folderId,
      imagePath: imagePath,
    );
  }

  Future<bool> updateById(
    int id, {
    required String name,
    required int categoryId,
    int? folderId,
    String? imagePath,
  }) {
    return _itemsDao.updateById(
      id,
      name: name,
      categoryId: categoryId,
      folderId: folderId,
      imagePath: imagePath,
    );
  }

  Future<bool> deleteById(int id) {
    return _itemsDao.setDeletedById(id, true);
  }

  Future<bool> restoreById(int id) {
    return _itemsDao.setDeletedById(id, false);
  }
}
