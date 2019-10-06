import 'package:flutter/material.dart';

import '../data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = "/category_meals_screen";

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  Category _category;
  List<Meal> _mealsList;
  bool _isMealsListLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if(_isMealsListLoaded)
      return;

    _category = ModalRoute.of(context).settings.arguments;

    _mealsList = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(_category.id);
    }).toList();

    _isMealsListLoaded = true;

  }

  void _deleteMealItem(Meal meal){
    setState(() {
      _mealsList.removeWhere((subjectMeal){
      return subjectMeal.id == meal.id;
    });
    }); 
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          title: Text(_category.title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(_mealsList[index],_deleteMealItem);
          },
          itemCount: _mealsList.length,
        )
    );
  }
}
