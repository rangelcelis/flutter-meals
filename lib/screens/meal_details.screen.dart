import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.model.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/widgets/meal_details_section.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    void toogleFavoriteMeal(Meal meal) {
      final wasAdded = ref
          .read(favoriteMealsProvider.notifier)
          .toggleMealFavoriteStatus(meal);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(wasAdded ? 'Meal added' : 'Meal removed'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            onPressed: () => toogleFavoriteMeal(meal),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image(
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
          const SizedBox(height: 16),
          MealDetailsSection(meal: meal),
        ]),
      ),
    );
  }
}
