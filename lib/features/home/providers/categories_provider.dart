import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_reviews/providers/repositories_provider.dart';
import 'package:personal_reviews/domain/models/category.dart';

final categoriesProvider = StreamProvider.autoDispose<List<CategoryWithStats>>((
  ref,
) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return categoryRepository.watchAllWithStats(false);
});
