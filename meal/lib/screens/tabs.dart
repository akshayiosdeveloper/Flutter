import 'package:flutter/material.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/data/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];

  void toggleMealFavoriteStatus(Meal meal) {
    print('Favorite Screen ✅');
    print("🎾Before favorite ${favouriteMeals}");
    final isExisting = favouriteMeals.contains(meal);
    if (isExisting) {
      favouriteMeals.remove(meal);
    } else {
      favouriteMeals.add(meal);
    }
    print("After favorite😇 ${favouriteMeals}");
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorites: toggleMealFavoriteStatus,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealScreen(
        meals: favouriteMeals,
        onToggleFavorites: toggleMealFavoriteStatus,
      );
      activePageTitle = 'Favourite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
