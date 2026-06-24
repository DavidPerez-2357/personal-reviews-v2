import 'package:personal_reviews/data/mappers/category_mapper.dart';
import 'package:personal_reviews/database/daos/categories_dao.dart';
import 'package:personal_reviews/domain/models/category.dart';

class CategoryRepository {
  final CategoriesDao _categoriesDao;

  CategoryRepository(this._categoriesDao);

  Future<List<CategoryDomain>> getAll(bool isDeleted) {
    return _categoriesDao
        .getAll(isDeleted)
        .then((categories) => CategoryMapper.fromRows(categories));
  }

  Future<CategoryDomain?> getById(int id) {
    return _categoriesDao
        .getById(id)
        .then(
          (category) =>
              category != null ? CategoryMapper.fromRow(category) : null,
        );
  }

  Stream<List<CategoryDomain>> watchAll(bool isDeleted) {
    return _categoriesDao
        .watchAll(isDeleted)
        .map(
          (categories) =>
              categories.map((c) => CategoryMapper.fromRow(c)).toList(),
        );
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

  /* Category with stats */
  Future<List<CategoryWithStats>> getAllWithStats(bool isDeleted) {
    return _categoriesDao
        .getAllWithStats(isDeleted)
        .then((dtos) => CategoryWithStatsMapper.fromRows(dtos));
  }
}
