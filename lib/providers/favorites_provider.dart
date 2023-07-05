import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.model.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final bool isMealFavorite = state.contains(meal);

    if (isMealFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
