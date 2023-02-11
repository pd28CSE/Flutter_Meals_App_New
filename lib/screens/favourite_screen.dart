import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const FavouriteScreen({super.key, required this.favouriteMeals});

  void unnecessaryWork(String no) {}

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text('you have no favourites yet.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (cntxt, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            deleteMeal: unnecessaryWork,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
