import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = 'filters-screen';
  final Function setFilterOnPressed;
  final Map<String, bool> currentFilters;
  const FiltersScreen({
    super.key,
    required this.currentFilters,
    required this.setFilterOnPressed,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _vagetarian = false;
  var _vagan = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'] as bool;
    _isLactoseFree = widget.currentFilters['lactose'] as bool;
    _vagan = widget.currentFilters['vegan'] as bool;
    _vagetarian = widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue,
      Function(bool) onPressed) {
    return SwitchListTile(
      value: currentValue,
      onChanged: onPressed,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('----------filter scr------');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Map<String, bool> _filters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _vagan,
                'vegetarian': _vagetarian,
              };
              widget.setFilterOnPressed(_filters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal section.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-Free',
                    'Only include Gluten-free meals.', _isGlutenFree, (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include Lactose-free meals.',
                    _isLactoseFree, (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include Vegetarian meals.', _vagetarian,
                    (value) {
                  setState(() {
                    _vagetarian = value;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals.', _vagan, (value) {
                  setState(() {
                    _vagan = value;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
