import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = 'meal-detail';
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String routeArgs =
        ModalRoute.of(context)!.settings.arguments as String;
    final mealItem = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == routeArgs;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('fsf'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
