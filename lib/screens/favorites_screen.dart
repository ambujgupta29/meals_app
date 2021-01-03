import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;
  FavoritesScreen(this.favoritedMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return Center(
        child: Text('You Have no fav yet add some !'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritedMeals[index].id,
            title: favoritedMeals[index].title,
            imageUrl: favoritedMeals[index].imageurl,
            duration: favoritedMeals[index].duration,
            affordability: favoritedMeals[index].affordability,
            complexity: favoritedMeals[index].complexity,
          );
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
