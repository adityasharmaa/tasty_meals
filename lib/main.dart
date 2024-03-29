import 'package:flutter/material.dart';
import 'package:meals_recipe/models/filters.dart';
import 'package:meals_recipe/models/meal.dart';

import './screens/filters_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters(false, false, false, false);
  List<Meal> _favouriteMeals = [];

  void _updateFilters(Filters filters) {
    setState(() {
      _filters = filters;
    });
  }

  bool _isFavourite(Meal meal) {
    return _favouriteMeals.contains(meal);
  }

  void _toggleFavourite(Meal meal) {
    setState(() {
      if (_favouriteMeals.contains(meal))
        _favouriteMeals.remove(meal);
      else
        _favouriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TastyMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                ),
              )),
      home: TabsScreen(_favouriteMeals),
      routes: {
        CategoryMealsScreen.route: (_) => CategoryMealsScreen(_filters),
        MealDetailsScreen.route: (_) =>
            MealDetailsScreen(_isFavourite, _toggleFavourite),
        FiltersScreen.route: (_) => FiltersScreen(_filters, _updateFilters),
      },
    );
  }
}
