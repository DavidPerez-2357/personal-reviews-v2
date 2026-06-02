import 'package:personal_reviews/data/mappers/category_mapper.dart';
import 'package:personal_reviews/database/daos/categories_dao.dart';
import 'package:personal_reviews/database/daos/reviews_dao.dart';
import 'package:personal_reviews/domain/models/category.dart';

class CategoryRepository {
  final CategoriesDao _categoriesDao;
  final ReviewsDao _reviewsDao;

  CategoryRepository(this._categoriesDao, this._reviewsDao);

  Future<List<CategoryDomain>> getAll(bool isDeleted) {
    return _categoriesDao
        .getAll(isDeleted)
        .then((categories) => CategoryMapper.fromRows(categories));
  }

  // With review counts
  Future<List<CategoryDomain>> getAllDetailed(bool isDeleted) async {
    final categories = await _categoriesDao.getAll(isDeleted);

    final categoryIds = categories.map((c) => c.id).toList();

    final reviewCounts = await _reviewsDao.getCountByCategoryIds(categoryIds);

    return categories.map((category) {
      final reviewCount = reviewCounts[category.id] ?? 0;

      return CategoryMapper.fromRow(category, reviewCount);
    }).toList();
  }

  Future<CategoryDomain?> getById(int id) {
    return _categoriesDao
        .getById(id)
        .then(
          (category) =>
              category != null ? CategoryMapper.fromRow(category, null) : null,
        );
  }

  Stream<List<CategoryDomain>> watchAll(bool isDeleted) {
    return _categoriesDao
        .watchAll(isDeleted)
        .map(
          (categories) =>
              categories.map((c) => CategoryMapper.fromRow(c, null)).toList(),
        );
  }

  Stream<List<CategoryDomain>> watchAllDetailed(bool isDeleted) {
    return _categoriesDao.watchAll(isDeleted).asyncMap((categories) async {
      final categoryIds = categories.map((c) => c.id).toList();

      final reviewCounts = await _reviewsDao.getCountByCategoryIds(categoryIds);

      return categories.map((category) {
        final reviewCount = reviewCounts[category.id] ?? 0;

        return CategoryMapper.fromRow(category, reviewCount);
      }).toList();
    });
  }

  Future<int> create({
    required String name,
    required CategoryColor color,
    required String icon,
  }) {
    return _categoriesDao.create(
      name: name,
      color: color.toDBFormat(),
      icon: icon,
    );
  }

  Future<bool> updateById(
    int id, {
    required String name,
    required CategoryColor color,
    required String icon,
  }) {
    return _categoriesDao.updateById(
      id,
      name: name,
      color: color.toDBFormat(),
      icon: icon,
    );
  }

  Future<bool> deleteById(int id) {
    return _categoriesDao.setDeletedById(id, true);
  }

  Future<bool> restoreById(int id) {
    return _categoriesDao.setDeletedById(id, false);
  }
}
