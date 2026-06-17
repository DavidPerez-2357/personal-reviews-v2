import 'package:personal_reviews/core/types/elements_sort.dart';
import 'package:personal_reviews/core/extensions/theme_context.dart';
import 'package:personal_reviews/core/types/sort.dart';
import 'package:flutter/material.dart';

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
  late ElementsSortField? _selectedField;
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
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            // Title
            Text('Ordenar', style: context.textTheme.titleLarge),

            const SizedBox(height: 14),

            // Sort field
            Text('Campo', style: context.textTheme.titleSmall),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _SortChip(
                  label: 'Nombre',
                  icon: Icons.sort_by_alpha_rounded,
                  selected: _selectedField == ElementsSortField.name,
                  onSelected: (_) => _onFieldSelected(ElementsSortField.name),
                ),
                _SortChip(
                  label: 'Fecha',
                  icon: Icons.calendar_today_rounded,
                  selected: _selectedField == ElementsSortField.date,
                  onSelected: (_) => _onFieldSelected(ElementsSortField.date),
                ),
                _SortChip(
                  label: 'Puntuación',
                  icon: Icons.star_rounded,
                  selected: _selectedField == ElementsSortField.rating,
                  onSelected: (_) => _onFieldSelected(ElementsSortField.rating),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Sort direction
            Text('Dirección', style: context.textTheme.titleSmall),

            Wrap(
              spacing: 8,
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

            const SizedBox(height: 20),

            // Action buttons
            Row(
              spacing: 12,
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
      avatar: Icon(icon, size: 18, color: Colors.white),
      label: Text(label),
    );
  }
}
