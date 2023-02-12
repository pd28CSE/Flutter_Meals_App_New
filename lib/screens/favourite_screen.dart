import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const FavouriteScreen({super.key, required this.favouriteMeals});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var f = '';
  void unnecessaryWork(String no) {
    setState(() {
      f = no;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('-----------fav scr-----------');
    if (widget.favouriteMeals.isEmpty) {
      return const Center(
        child: Text('you have no favourites yet.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (cntxt, index) {
          return MealItem(
            id: widget.favouriteMeals[index].id,
            deleteMeal: unnecessaryWork,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
