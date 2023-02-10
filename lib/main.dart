import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/page_not_found_error_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          return const TabsScreen();
        },
        CategoriesScreen.routeName: (cntxt) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (cntxt) => CategoryMealsScreen(),
        // MealDetailScreen.routeName: (cntxt) => MealDetailScreen(),
        FiltersScreen.routeName: (cntxt) => const FiltersScreen(),
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
