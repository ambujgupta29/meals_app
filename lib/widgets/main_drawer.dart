import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String Title, IconData icon, Function Taphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        Title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: Taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
