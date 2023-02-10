import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = 'meals-category';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen({
  //   super.key,
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });

  void deleteMealOnPressed(String mealId) {
    print('remove -> $mealId');
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'] as String;
    final String categoryTitle = routeArgs['title'] as String;
    final categoryMeals = DUMMY_MEALS.where((item) {
      return item.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (cntxt, index) {
          return MealItem(
            id: categoryMeals[index].id,
            deleteMeal: deleteMealOnPressed,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
