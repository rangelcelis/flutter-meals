import 'package:flutter/material.dart';
import 'package:meals/models/meal.model.dart';

class MealDetailsSection extends StatelessWidget {
  const MealDetailsSection({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          for (final ingredient in meal.ingredients)
            Text(
              '- $ingredient',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          const SizedBox(height: 20),
          Text(
            'Steps',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          for (int index = 0; index < meal.steps.length; index++)
            Text(
              '${index + 1}. ${meal.steps[index]}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            )
        ],
      ),
    );
  }
}
