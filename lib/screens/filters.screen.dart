import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/widgets/filter_item.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    final notifier = ref.read(filtersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.glutenFree, isChecked),
          ),
          FilterItem(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.lactoseFree, isChecked),
          ),
          FilterItem(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.vegetarian, isChecked),
          ),
          FilterItem(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) =>
                notifier.setFilter(Filter.vegan, isChecked),
          ),
        ],
      ),
    );
  }
}
