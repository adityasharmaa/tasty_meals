import 'package:flutter/material.dart';
import 'package:meals_recipe/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const route = "/meal_details_screen";

  final Function _isFavourite;
  final Function _toggleFavourite;

  MealDetailsScreen(this._isFavourite, this._toggleFavourite);

  Widget _buildTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal _meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                _meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitle("Ingredients", context),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        "${index + 1}.  ${_meal.ingredients[index]}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                itemCount: _meal.ingredients.length,
              ),
            ),
            _buildTitle("Steps", context),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          "${index + 1}",
                        ),
                      ),
                      title: Text(
                        _meal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                );
              },
              itemCount: _meal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavourite(_meal) ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          _toggleFavourite(_meal);
        },
      ),
    );
  }
}
