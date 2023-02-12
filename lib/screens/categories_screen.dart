import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "categories-screen";

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('---- catego  scre------');
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: <Widget>[
        ...DUMMY_CATEGORIES.map((item) {
          return CategoryItem(
            id: item.id,
            title: item.title,
            bgcolor: item.color,
          );
        }).toList(),
      ],
    );
  }
}
