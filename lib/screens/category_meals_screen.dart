import 'package:flutter/material.dart';

import '../models/filters.dart';
import '../data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = "/category_meals_screen";

  final Filters _filters;

  CategoryMealsScreen(this._filters);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category _category;
  List<Meal> _mealsList;
  bool _isMealsListLoaded = false;

  @override
  void initState() {
    super.initState();

    _mealsList = DUMMY_MEALS.where((meal) {
      if (!meal.isGlutenFree && widget._filters.getGluten) return false;

      if (!meal.isVegan && widget._filters.getVegan) return false;

      if (!meal.isVegetarian && widget._filters.getVegetarian) return false;

      if (!meal.isLactoseFree && widget._filters.getLacose) return false;

      return true;
    }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isMealsListLoaded) return;

    _category = ModalRoute.of(context).settings.arguments;

    _mealsList = _mealsList.where((meal) {
      return meal.categories.contains(_category.id);
    }).toList();

    _isMealsListLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_category.title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(_mealsList[index]);
          },
          itemCount: _mealsList.length,
        ));
  }
}
