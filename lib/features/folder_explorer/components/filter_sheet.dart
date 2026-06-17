import 'package:personal_reviews/core/constants/category_icons.dart';
import 'package:personal_reviews/core/types/elements_filter.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/core/types/folder_explorer.dart';
import 'package:personal_reviews/domain/models/category.dart';
import 'package:flutter/material.dart';

class ElementsFilterSheet extends StatefulWidget {
  const ElementsFilterSheet({
    super.key,
    required this.allCategories,
    required this.currentFilter,
    required this.onFilterApplied,
    required this.config,
  });

  final List<CategoryDomain> allCategories;
  final ElementsFilter currentFilter;
  final FolderExplorerConfig config;

  final ValueChanged<ElementsFilter> onFilterApplied;

  @override
  State<ElementsFilterSheet> createState() => ElementsFilterSheetState();
}

class ElementsFilterSheetState extends State<ElementsFilterSheet> {
  late ElementsVisibility _selectedVisibility;
  late int _minRating;
  late int _maxRating;
  late List<int> _selectedCategoryIds;

  @override
  void initState() {
    super.initState();
    _selectedVisibility = widget.currentFilter.visibility;
    _minRating = widget.currentFilter.minRating;
    _maxRating = widget.currentFilter.maxRating;
    _selectedCategoryIds = [...widget.currentFilter.categoryIds];
  }

  void resetFilter() {
    setState(() {
      _selectedVisibility = widget.config.defaultFilter.visibility;
      _minRating = widget.config.defaultFilter.minRating;
      _maxRating = widget.config.defaultFilter.maxRating;
      _selectedCategoryIds = [...widget.config.defaultFilter.categoryIds];
    });
  }

  void applyFilter() {
    widget.onFilterApplied(
      ElementsFilter(
        visibility: _selectedVisibility,
        minRating: _minRating,
        maxRating: _maxRating,
        categoryIds: _selectedCategoryIds,
      ),
    );
    Navigator.pop(context);
  }

  void _onVisibilitySelected(ElementsVisibility visibility) {
    setState(() {
      _selectedVisibility = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 18,
          children: [
            Text('Filtrar', style: context.textTheme.titleLarge),

            if (widget.config.showVisibilityFilter &&
                widget.config.groupByFolders)
              _VisibilityFilter(
                selectedVisibility: _selectedVisibility,
                onVisibilitySelected: _onVisibilitySelected,
              ),

            _RatingFilter(
              minRating: _minRating,
              maxRating: _maxRating,
              onRatingChanged: (RangeValues values) {
                setState(() {
                  _minRating = (values.start * 2).round();
                  _maxRating = (values.end * 2).round();
                });
              },
            ),

            // Categories
            if (widget.config.showCategoriesFilter) ...[
              _CategoryFilter(
                allCategories: widget.allCategories,
                selectedCategoryIds: _selectedCategoryIds,
                onCategorySelected: (categoryId) {
                  setState(() {
                    if (!_selectedCategoryIds.contains(categoryId)) {
                      _selectedCategoryIds.add(categoryId);
                    }
                  });
                },
                onCategoryDeselected: (categoryId) {
                  setState(() {
                    _selectedCategoryIds.remove(categoryId);
                  });
                },
              ),
            ],

            const SizedBox(height: 6),

            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      resetFilter();
                    },
                    icon: const Icon(Icons.restart_alt_rounded),
                    label: const Text('Resetear'),
                  ),
                ),

                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => applyFilter(),
                    icon: const Icon(Icons.check_rounded),
                    label: const Text('Aplicar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.context,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onSelected,
  });

  final BuildContext context;
  final String label;
  final IconData icon;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      onSelected: (value) {
        FocusManager.instance.primaryFocus?.unfocus();

        onSelected(value);
      },
      avatar: Icon(
        icon,
        size: 18,
        color: selected ? context.colors.onSecondary : context.colors.onSurface,
      ),
      label: Text(label),
    );
  }
}

class _CategoryFilterChip extends StatelessWidget {
  const _CategoryFilterChip({
    required this.category,
    required this.selected,
    required this.onSelected,
  });

  final CategoryDomain category;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      onSelected: (value) {
        FocusManager.instance.primaryFocus?.unfocus();

        onSelected(value);
      },
      avatar: Icon(
        getCategoryIconData(category.icon),
        size: 18,
        color: Colors.white,
      ),
      label: Text(category.name),
      selectedColor: category.color.toColor().withValues(alpha: 0.6),
    );
  }
}

// WIdget for visibility filter
class _VisibilityFilter extends StatelessWidget {
  const _VisibilityFilter({
    required this.selectedVisibility,
    required this.onVisibilitySelected,
  });

  final ElementsVisibility selectedVisibility;
  final ValueChanged<ElementsVisibility> onVisibilitySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('Visibilidad', style: context.textTheme.titleSmall),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _FilterChip(
              context: context,
              label: ElementsVisibility.all.label,
              icon: Icons.category_rounded,
              selected: selectedVisibility == ElementsVisibility.all,
              onSelected: (_) => onVisibilitySelected(ElementsVisibility.all),
            ),
            _FilterChip(
              context: context,
              label: ElementsVisibility.foldersOnly.label,
              icon: Icons.folder_rounded,
              selected: selectedVisibility == ElementsVisibility.foldersOnly,
              onSelected: (_) =>
                  onVisibilitySelected(ElementsVisibility.foldersOnly),
            ),
            _FilterChip(
              context: context,
              label: ElementsVisibility.itemsOnly.label,
              icon: Icons.star_rounded,
              selected: selectedVisibility == ElementsVisibility.itemsOnly,
              onSelected: (_) =>
                  onVisibilitySelected(ElementsVisibility.itemsOnly),
            ),
          ],
        ),
      ],
    );
  }
}

// Widget for rating filter
class _RatingFilter extends StatelessWidget {
  const _RatingFilter({
    required this.minRating,
    required this.maxRating,
    required this.onRatingChanged,
  });

  final int minRating;
  final int maxRating;
  final ValueChanged<RangeValues> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          'Puntuación  (${minRating / 2} - ${maxRating / 2} ★)',
          style: context.textTheme.titleSmall,
        ),

        RangeSlider(
          values: RangeValues(
            minRating.toDouble() / 2,
            maxRating.toDouble() / 2,
          ),
          min: 0,
          max: 5,
          divisions: 10,
          labels: RangeLabels('${(minRating / 2)} ★', '${(maxRating / 2)}  ★'),
          onChanged: (RangeValues values) {
            onRatingChanged(values);
          },
        ),
      ],
    );
  }
}

// Widget for category filter
class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({
    required this.allCategories,
    required this.selectedCategoryIds,
    required this.onCategorySelected,
    required this.onCategoryDeselected,
  });

  final List<CategoryDomain> allCategories;
  final List<int> selectedCategoryIds;
  final ValueChanged<int> onCategorySelected;
  final ValueChanged<int> onCategoryDeselected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          'Categorías (${selectedCategoryIds.length})',
          style: context.textTheme.titleSmall,
        ),

        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Row(
                  spacing: 8,
                  children: [
                    for (var category in allCategories)
                      _CategoryFilterChip(
                        category: category,
                        // search id
                        selected: selectedCategoryIds.contains(category.id),

                        onSelected: (isSelected) => isSelected
                            ? onCategorySelected(category.id)
                            : onCategoryDeselected(category.id),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
