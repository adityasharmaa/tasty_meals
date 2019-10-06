import 'package:flutter/material.dart';
import 'package:meals_recipe/widgets/main_drawer.dart';

import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String,Object>> _screensList = [
    {
      "page" : CategoriesScreen(),
      "title" : "Categories",
    },
    {
      "page" : FavouritesScreen(),
      "title" : "Favourites",
    }
  ];

  int _selectedIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
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