import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../Models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  TabsScreen(this.favoritedMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _SelectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoritedMeals),
        'title': ' Your Favorites'
      },
    ];
    super.initState();
  }

  void _SelectPage(int index) {
    setState(() {
      _SelectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_SelectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_SelectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _SelectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _SelectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
