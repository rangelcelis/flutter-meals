import 'package:flutter/material.dart';
import 'package:meals/models/meal.model.dart';
import 'package:meals/widgets/meal_details_section.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToogleMealFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToogleMealFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () => onToogleMealFavorite(meal),
          )
        ],
      ),
      body: Column(children: [
        Image(
          image: NetworkImage(meal.imageUrl),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 250,
        ),
        const SizedBox(height: 16),
        MealDetailsSection(meal: meal),
      ]),
    );
  }
}
