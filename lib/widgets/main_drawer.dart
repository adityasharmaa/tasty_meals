import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function tapFunction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      onTap: tapFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "Semantic label",
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 200,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text(
              "Hungry?",
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _buildListTile("Categories", Icons.category, () {
            Navigator.of(context).pushNamed("/");
          }),
          _buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.route);
          }),
        ],
      ),
    );
  }
}
