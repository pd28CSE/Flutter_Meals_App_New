import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourite_screen.dart';
import '../widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = "tabs-screen";
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentScreenIndex = 0;
  List<Map<String, Object>> _tabScreens = const [
    {'screen': CategoriesScreen(), 'title': 'Categories'},
    {'screen': FavouriteScreen(), 'title': 'Favourites'},
  ];

  void _changeScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabScreens[_currentScreenIndex]['title'] as String),
      ),
      drawer: const MyDrawer(),
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
