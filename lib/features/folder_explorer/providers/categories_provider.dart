import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_reviews/domain/models/category.dart';
import 'package:personal_reviews/providers/repositories_provider.dart';

final categoriesProvider = FutureProvider<List<CategoryDomain>>((ref) async {
  final repository = ref.read(categoryRepositoryProvider);
  return repository.getAll(false);
});
