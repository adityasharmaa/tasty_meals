import 'package:flutter/material.dart';

import '../models/filters.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route = "/filters_screen";

  final Filters _filters;
  final Function _updateFilters;

  FiltersScreen(this._filters, this._updateFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchListTile(
    String title,
    String subTitle,
    bool selected,
    Function updateItems,
  ) {
    return SwitchListTile(
      value: selected,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: updateItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget._updateFilters(widget._filters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Text(
            "Customize your meals list.",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  "Gluten-free",
                  "Contains only gluten-free items",
                  widget._filters.getGluten, (newValue) {
                setState(() {
                  widget._filters.setGluten = newValue;
                });
              }),
              _buildSwitchListTile("Vegan", "Contains only vegan items",
                  widget._filters.getVegan, (newValue) {
                setState(() {
                  widget._filters.setVegan = newValue;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian",
                  "Contains only vegetarian items",
                  widget._filters.getVegetarian, (newValue) {
                setState(() {
                  widget._filters.setVegetarian = newValue;
                });
              }),
              _buildSwitchListTile(
                  "Lactose-free",
                  "Contains only lactose-free items",
                  widget._filters.getLacose, (newValue) {
                setState(() {
                  widget._filters.setLactose = newValue;
                });
              }),
            ],
          ),
        ),
      ]),
    );
  }
}
