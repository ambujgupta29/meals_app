import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem({this.color, this.title, this.id});
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
