import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgcolor;
  const CategoryItem({
    super.key,
    required this.id,
    required this.title,
    required this.bgcolor,
  });

  void chageScreen(BuildContext cntxt, String id, String title) {
    // Navigator.of(cntxt).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(
    //         categoryId: id,
    //         categoryTitle: title,
    //       );
    //     },
    //   ),
    // );

    Navigator.of(cntxt).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('-------cate item---------');
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: bgcolor,
      onTap: () => chageScreen(context, id, title),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgcolor.withOpacity(0.4),
              bgcolor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
