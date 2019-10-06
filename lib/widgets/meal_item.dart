import 'package:flutter/material.dart';
import 'package:meals_recipe/models/meal.dart';
import 'package:meals_recipe/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;

  MealItem(this._meal);

  void showMealItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.route,
      arguments: _meal,
    );
  }

  String get complexityText{
    switch(_meal.complexity){
      case Complexity.Simple : return "Simple" ;
      case Complexity.Challenging : return "Challenging";
      case Complexity.Difficult : return "Difficult";
      default : return "Unknown";
    }
  }

  String get affordabilityText{
    switch(_meal.affordability){
      case Affordability.Affordable : return "Affordable";
      case Affordability.Luxurious : return "Expensive";
      case Affordability.Pricey : return "Pricey";
      default : return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => showMealItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(5),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    _meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: width * 0.7,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      _meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${_meal.duration} min")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$complexityText")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$affordabilityText")
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
