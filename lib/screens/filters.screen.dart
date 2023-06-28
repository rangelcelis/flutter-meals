import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_item.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFreeFilterSet = false;
  bool _isLactoseFreeFilterSet = false;
  bool _isVegetarianFilterSet = false;
  bool _isVeganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _isLactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _isVegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _isVeganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFreeFilterSet,
            Filter.lactoseFree: _isLactoseFreeFilterSet,
            Filter.vegetarian: _isVegetarianFilterSet,
            Filter.vegan: _isVeganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            FilterItem(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              value: _isGlutenFreeFilterSet,
              onChanged: (isChecked) => setState(() {
                _isGlutenFreeFilterSet = isChecked;
              }),
            ),
            FilterItem(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              value: _isLactoseFreeFilterSet,
              onChanged: (isChecked) => setState(() {
                _isLactoseFreeFilterSet = isChecked;
              }),
            ),
            FilterItem(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              value: _isVegetarianFilterSet,
              onChanged: (isChecked) => setState(() {
                _isVegetarianFilterSet = isChecked;
              }),
            ),
            FilterItem(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              value: _isVeganFilterSet,
              onChanged: (isChecked) => setState(() {
                _isVeganFilterSet = isChecked;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
