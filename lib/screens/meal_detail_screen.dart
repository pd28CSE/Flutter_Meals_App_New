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

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(mealId);
            },
            icon: const Icon(
              Icons.remove,
            ),
            tooltip: 'Remove',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ingrediants',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (cntxt, index) {
                  return Card(
                    elevation: 5,
                    color: Colors.amber,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (cntxt, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${index + 1}')),
                      title: Text(
                        selectedMeal.steps[index],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.star),
      ),
    );
  }
}
