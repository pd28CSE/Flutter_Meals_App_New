import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = 'meal-detail';
  final String mealId;
  const MealDetailScreen({super.key, required this.mealId});

  Meal get selectedMeal {
    return DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
  }

  @override
  Widget build(BuildContext context) {
    /* ------------- this part is use when, this "MealDetailScreen"
     class is not data pass through constructor ---------------*/

    // final String routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as String;
    // final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
    //   return meal.id == routeArgs;
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
