import 'package:personal_reviews/data/mappers/item_mapper.dart';
import 'package:personal_reviews/database/daos/items_dao.dart';
import 'package:personal_reviews/domain/models/item.dart';

class ItemRepository {
  final ItemsDao _itemsDao;

  ItemRepository(this._itemsDao);

  Future<List<ItemDomain>> getAll(bool isDeleted) async {
    return _itemsDao
        .getAll(isDeleted)
        .then((items) => ItemMapper.fromRows(items));
  }

  Future<ItemDomain?> getById(int id) async {
    final item = await _itemsDao.getById(id);
    if (item == null) return null;

    final items = ItemMapper.fromRows([item]);
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

  /* Item with last review */
  Stream<List<ItemWithLastReview>> watchItemsWithLastReviewByCategoryId(
    int categoryId,
  ) {
    return _itemsDao
        .watchItemsWithLastReviewByCategoryId(categoryId)
        .map((rows) => ItemWithLastReviewMapper.fromRows(rows));
  }

  Stream<List<ItemWithLastReview>> watchItemsWithLastReviewByFolderId(
    int folderId,
  ) {
    return _itemsDao
        .watchItemsWithLastReviewByFolderId(folderId)
        .map((rows) => ItemWithLastReviewMapper.fromRows(rows));
  }
}
