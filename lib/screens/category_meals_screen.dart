import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = 'meals-category';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen({
  //   super.key,
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String id = routeArgs['id'] as String;
    final String title = routeArgs['title'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(id.toString()),
      ),
    );
  }
}
