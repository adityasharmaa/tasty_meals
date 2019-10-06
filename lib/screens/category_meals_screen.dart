import 'package:flutter/material.dart';
import 'package:meals_recipe/data.dart';
import 'package:meals_recipe/widgets/meal_item.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = "/category_meals_screen";

  @override
  Widget build(BuildContext context) {
    final Category _category = ModalRoute.of(context).settings.arguments;

    final _mealsList = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(_category.id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(_category.title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(_mealsList[index]);
          },
          itemCount: _mealsList.length,
        )
    );
  }
}
