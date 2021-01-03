import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function savefilters;
  final Map<String, bool> currentfilters;

  FilterScreen(this.currentfilters, this.savefilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  void initState() {
    _glutenfree = widget.currentfilters['gluten'];
    _lactosefree = widget.currentfilters['lactose'];
    _vegan = widget.currentfilters['vegan'];
    _vegetarian = widget.currentfilters['vegetarian'];

    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentvalue,
    Function Updatevalue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue,
      subtitle: Text(description),
      onChanged: Updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedfilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.savefilters(selectedfilters);
              },
            ),
          ],
          title: Text(
            'filters',
          ),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Adjust some meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                      'Gluten-Free',
                      'Only Include Gluten-Free Meals',
                      _glutenfree, (newValue) {
                    setState(() {
                      _glutenfree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Lactose-Free',
                      'Only Include Lactose-Free Meals',
                      _lactosefree, (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegan', 'Only Include Vegan Meals', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  buildSwitchListTile('Vegetarian',
                      'Only Include Vegetarian Meals', _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
