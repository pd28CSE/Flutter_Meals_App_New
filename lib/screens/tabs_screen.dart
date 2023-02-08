import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = 'tabs-screen';

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenSate();
}

class _TabsScreenSate extends State<TabsScreen> {
  List<Widget> _tabScreens = [CategoriesScreen(), FavouriteScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabScreens.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Bar'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            // indicatorSize: TabBarIndicatorSize.label,
            // indicatorWeight: 5,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
            ),
            tabs: const <Tab>[
              Tab(
                icon: Icon(Icons.home),
                child: Text('Home'),
              ),
              Tab(
                icon: Icon(Icons.favorite),
                child: Text('Favorite'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabScreens.map((screen) => screen).toList(),
        ),
      ),
    );
  }
}
