import 'package:personal_reviews/core/interfaces/search_query.dart';

abstract interface class BaseDataSource<T> {
  Future<List<T>> getAll();

  Future<T?> getById(int id);

  Future<int> countAll();

  Future<int> create(T item);

  Future<int> update(T item);

  Future<int> delete(int id);
}

abstract interface class PaginableDataSource<T> {
  Future<List<T>> getPaginated({
    required int page,
    required int pageSize,
    SearchQuery query
  });

  Future<int> count(SearchQuery query);
}

abstract interface class SearchableDataSource<T> {
  Future<List<T>> search(SearchQuery query);
}

abstract interface class SoftDeletableDataSource<T> {
  Future<List<T>> getAllByDeleted(bool deleted);

  Future<T?> getExistingById(int id);

  Future<int> countByDeleted(bool deleted);

  Future<bool> isDeleted(int id);

  Future<int> setDeleted(int id, bool deleted);
}