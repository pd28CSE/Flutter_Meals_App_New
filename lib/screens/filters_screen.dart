import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName = 'filters-screen';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
