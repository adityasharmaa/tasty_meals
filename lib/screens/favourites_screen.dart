import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;

  FavouritesScreen(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty)
      return Center(
        child: Text("You do not have favourite yet -- start adding some."),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(_favouriteMeals[index]);
        },
        itemCount: _favouriteMeals.length,
      );
  }
}
