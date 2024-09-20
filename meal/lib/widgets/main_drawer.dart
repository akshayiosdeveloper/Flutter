import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                SizedBox(width: 18),
                Text("Cooking Up!!!"),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text('Meals'),
            onTap: () {
              print("mealsdrawe");

              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter,
              size: 26,
            ),
            title: Text('Filters'),
            onTap: () {
              print("filter tile");
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
