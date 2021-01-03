import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'package:meals_app/Models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];
  void _setfilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingindex = _favoritedMeals.indexWhere((meal) {
      meal.id == mealId;
    });
    if (existingindex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingindex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _ismealfavourite(String id) {
    if (_favoritedMeals.any((meal) => meal.id == id)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
      ),
//      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoritedMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealsDetailScreen.routeName: (context) =>
            MealsDetailScreen(_toggleFavorites, _ismealfavourite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setfilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoryMealsScreen(_availableMeals),
        );
      },
    );
  }
}
