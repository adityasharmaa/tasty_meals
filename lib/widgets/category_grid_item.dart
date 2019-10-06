import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category _category;

  const CategoryGridItem(this._category);

  void _openCategoryMealsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.route,
      arguments: _category
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openCategoryMealsScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _category.color.withOpacity(0.6),
              _category.color,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
