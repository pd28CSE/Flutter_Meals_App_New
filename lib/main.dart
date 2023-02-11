import 'package:flutter/material.dart';

import './models/meal.dart';
import './models/dummy_data.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/page_not_found_error_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggle_favouriteMeals(String mealId) {
    int mealIndex =
        _favouriteMeals.indexWhere((mealItem) => (mealItem.id == mealId));
    if (mealIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.elementAt(mealIndex));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 24,
                // fontFamily: 'RobotoCondensed',
              ),
              titleSmall: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      title: 'App Bar',
      // home: const CategoriesScreen(),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (cntxt) {
          return TabsScreen(favouriteMeals: _favouriteMeals);
        },
        CategoriesScreen.routeName: (cntxt) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (cntxt) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        // MealDetailScreen.routeName: (cntxt) => MealDetailScreen(),
        FiltersScreen.routeName: (cntxt) => FiltersScreen(
            currentFilters: _filters, setFilterOnPressed: _setFilters),
      },
      onGenerateRoute: (settings) {
        if (settings.name == MealDetailScreen.routeName) {
          final String routeArgs = settings.arguments as String;
          return MaterialPageRoute(
              builder: (cntxt) => MealDetailScreen(
                    mealId: routeArgs,
                  ));
        }
        // else if (settings.name == 'other routes') {
        //   return MaterialPageRoute(builder: (cntxt) => AnyOtherScreen());
        // }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (cntxt) => const PageNotFoundErrorMessageScreen(),
        );
      },
    );
  }
}
