import 'package:personal_reviews/features/view_category_reviews/view_category_reviews.dart';
import 'package:personal_reviews/shared/components/app_critic_error_dialog.dart';
import 'package:personal_reviews/shared/components/app_empty_state.dart';
import 'package:personal_reviews/features/home/providers/categories_provider.dart';
import 'package:personal_reviews/features/home/components/category_card.dart';
import 'package:personal_reviews/shared/errors/error_type_presenter.dart';
import 'package:personal_reviews/shared/errors/error_type.dart';
import 'package:personal_reviews/domain/models/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ViewAllCategories extends ConsumerStatefulWidget {
  const ViewAllCategories({super.key});

  @override
  ConsumerState<ViewAllCategories> createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends ConsumerState<ViewAllCategories> {
  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    /* Listen for errors and show dialog if needed */
    ref.listen<AsyncValue<List<CategoryWithStats>>>(categoriesProvider, (
      _,
      next,
    ) async {
      if (!next.hasError) {
        return;
      }

      await AppCriticErrorDialog.show(
        context,
        ErrorTypePresenter.of(ErrorType.database),
        'No se pudieron cargar las categorías.',
        onRetry: () => ref.refresh(categoriesProvider.future),
      );
    });

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(categoriesProvider);
      },
      child: categoriesAsync.when(
        data: (categories) => categories.isEmpty
            ? _EmptyCategoriesView()
            : _CategoriesGrid(categories: categories),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => _EmptyCategoriesView(),
      ),
    );
  }
}

class _CategoriesGrid extends StatelessWidget {
  const _CategoriesGrid({required this.categories});

  final List<CategoryWithStats> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return CategoryCard(
          category: category,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ViewCategoryReviews(category: category),
              ),
            );
          },
        );
      },
    );
  }
}

class _EmptyCategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 500,
          child: AppEmptyState(
            icon: Icons.category_rounded,
            title: 'Aún no hay categorías',
            message: 'Cuando se creen categorías, aparecerán aquí.',
          ),
        ),
      ],
    );
  }
}
