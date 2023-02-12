import 'package:flutter/material.dart';

import '../models/meal.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = "tabs-screen";
  final List<Meal> favouriteMeals;
  const TabsScreen({super.key, required this.favouriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentScreenIndex = 0;
  List<Map<String, Object>> _tabScreens = [];

  @override
  void initState() {
    _tabScreens = [
      {'screen': const CategoriesScreen(), 'title': 'Categories'},
      {
        'screen': FavouriteScreen(favouriteMeals: widget.favouriteMeals),
        'title': 'Favourites'
      },
    ];
    super.initState();
  }

  void _changeScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('--------tab scr-----');
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabScreens[_currentScreenIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _tabScreens[_currentScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: _changeScreen,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
