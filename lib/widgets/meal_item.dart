import 'package:flutter/material.dart';
import 'package:practice/models/meal.dart';

import '../models/dummy_data.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  const MealItem({
    super.key,
    required this.id,
  });

  String getComplexityText(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String getAffordabilityText(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void changeScreen(BuildContext context, String mealId) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: mealId);
  }

  @override
  Widget build(BuildContext context) {
    final meal = DUMMY_MEALS.firstWhere((mealItem) {
      return mealItem.id == id;
    });
    return InkWell(
      onTap: () => changeScreen(context, meal.id),
      splashColor: Colors.pink,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
            bottom: Radius.circular(15),
          ),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      meal.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.access_time,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${meal.duration}',
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        getComplexityText(meal.complexity),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.attach_money,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        getAffordabilityText(meal.affordability),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
