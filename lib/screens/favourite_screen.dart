import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const FavouriteScreen({super.key, required this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favourite'),
    );
  }
}
