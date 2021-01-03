import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../Models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
//  final String categoryid;
//  final String categoryTitle;
//
//  CategoryMealsScreen({this.categoryid, this.categoryTitle});
  static const routeName = '/categories-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeargs['title'];
    final categoryId = routeargs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageurl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
