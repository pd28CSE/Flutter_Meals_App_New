import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = 'meals-category';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  String? categoryTitle;
  List<Meal> displayedMeals = [];

  @override
  void initState() {
    print('------init State');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('------did Change Dependencies');
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'] as String;
    categoryTitle = routeArgs['title'] as String;
    displayedMeals = DUMMY_MEALS.where((item) {
      return item.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('------dispose');
    super.dispose();
  }

  void deleteMealOnPressed(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
    print('remove -> $mealId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (cntxt, index) {
          return MealItem(
            id: displayedMeals[index].id,
            deleteMeal: deleteMealOnPressed,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
