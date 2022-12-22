import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});
  static const routName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Filters",
        ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("filters"),
      ),
    );
  }
}
