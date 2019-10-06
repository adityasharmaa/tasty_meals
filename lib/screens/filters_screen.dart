import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {

  static const route = "/filters_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Center(
        child: Text("Filters screen"),
      ),
      drawer: MainDrawer(),
    );
  }
}
