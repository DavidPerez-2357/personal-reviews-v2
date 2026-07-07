import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/core/types/sort.dart';
import 'package:flutter/material.dart';
import 'package:personal_reviews/style/design_system/app_size.dart';
import 'package:personal_reviews/style/design_system/app_spacing.dart';

class ElementsSortSheet extends StatefulWidget {
  const ElementsSortSheet({
    super.key,
    required this.currentSort,
    this.defaultSort = const ElementsSort(),
    required this.onSortApplied,
  });

  final ElementsSort currentSort;
  final ElementsSort defaultSort;

  final ValueChanged<ElementsSort> onSortApplied;

  @override
  State<ElementsSortSheet> createState() => ElementsSortSheetState();
}

class ElementsSortSheetState extends State<ElementsSortSheet> {
  late ElementsSortField _selectedField;
  late SortType _sortType;

  @override
  void initState() {
    super.initState();

    _selectedField = widget.currentSort.field;
    _sortType = widget.currentSort.type;
  }

  void _onFieldSelected(ElementsSortField field) {
    setState(() {
      _selectedField = field;
    });
  }

  void _onSortTypeSelected(SortType type) {
    setState(() {
      _sortType = type;
    });
  }

  void resetSort() {
    setState(() {
      _selectedField = widget.defaultSort.field;
      _sortType = widget.defaultSort.type;
    });
  }

  void applySort() {
    widget.onSortApplied(ElementsSort(field: _selectedField, type: _sortType));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppInsets.allLg.copyWith(top: AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.nm,
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: AppSpacing.lg,
              children: [
                Text(
                  'Ordenar',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),

            // Sort field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.xs,
              children: [
                Text('Campo', style: context.textTheme.titleSmall),

                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.xxs,
                  children: [
                    _SortChip(
                      label: 'Creación',
                      icon: Icons.flare,
                      selected: _selectedField == ElementsSortField.creation,
                      onSelected: (_) =>
                          _onFieldSelected(ElementsSortField.creation),
                    ),
                    _SortChip(
                      label: 'Nombre',
                      icon: Icons.sort_by_alpha_rounded,
                      selected: _selectedField == ElementsSortField.name,
                      onSelected: (_) =>
                          _onFieldSelected(ElementsSortField.name),
                    ),
                    _SortChip(
                      label: 'Fecha',
                      icon: Icons.calendar_today_rounded,
                      selected: _selectedField == ElementsSortField.date,
                      onSelected: (_) =>
                          _onFieldSelected(ElementsSortField.date),
                    ),
                    _SortChip(
                      label: 'Puntuación',
                      icon: Icons.star_rounded,
                      selected: _selectedField == ElementsSortField.rating,
                      onSelected: (_) =>
                          _onFieldSelected(ElementsSortField.rating),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 0),

            // Sort direction
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.xs,
              children: [
                Text('Dirección', style: context.textTheme.titleSmall),

                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.xxs,
                  children: [
                    _SortChip(
                      label: 'Ascendente',
                      icon: Icons.arrow_upward_rounded,
                      selected: _sortType == SortType.ASC,
                      onSelected: (_) => _onSortTypeSelected(SortType.ASC),
                    ),
                    _SortChip(
                      label: 'Descendente',
                      icon: Icons.arrow_downward_rounded,
                      selected: _sortType == SortType.DESC,
                      onSelected: (_) => _onSortTypeSelected(SortType.DESC),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 0),

            // Action buttons
            Row(
              spacing: AppSpacing.sm,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      resetSort();
                    },
                    icon: const Icon(Icons.restart_alt_rounded),
                    label: const Text('Resetear'),
                  ),
                ),

                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => applySort(),
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

class _SortChip extends StatelessWidget {
  const _SortChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      onSelected: onSelected,
      avatar: Icon(icon, size: AppSizes.chipIconSize, color: Colors.white),
      label: Text(label),
    );
  }
}
