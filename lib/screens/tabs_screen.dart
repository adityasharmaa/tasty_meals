import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;

  TabsScreen(this._favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screensList;

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screensList = [
      {
        "page": CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": FavouritesScreen(widget._favouriteMeals),
        "title": "Favourites",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screensList[_selectedIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _screensList[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favourites"),
          ),
        ],
      ),
    );
  }
}
