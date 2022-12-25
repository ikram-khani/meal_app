import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> currenFilters;
  final Function(Map<String, bool>) saveFilters;
  const FiltersScreen(this.currenFilters, this.saveFilters, {super.key});
  static const routName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currenFilters['gluten']!;
    _lactoseFree = widget.currenFilters['lactose']!;
    _vegan = widget.currenFilters['vegan']!;
    _vegetarian = widget.currenFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Your Filters",
          ),
          actions: [
            IconButton(
              onPressed: (() {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              }),
              icon: const Icon(Icons.save),
              tooltip: "Save",
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include Gluten-free meals',
                  _glutenFree,
                  ((newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include Lactose-free meals',
                  _lactoseFree,
                  ((newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Vegeterian',
                  'Only include Vegetarian meals',
                  _vegetarian,
                  ((newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  _vegan,
                  ((newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ),
              ],
            ))
          ],
        ));
  }
}
