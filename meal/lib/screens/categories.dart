import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/data/meal.dart';
import 'package:meal/models/categoryitem.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorites});
  final void Function(Meal meal) onToggleFavorites;

  void _selectedCategory(BuildContext context, CategoryItem categoryItem) {
    var filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryItem.id))
        .toList();
    print(filteredMeals.first.categories);
    print("categories screen 😆");
    print("onToggleFavorites🍎 ${onToggleFavorites}");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: categoryItem.title,
          meals: filteredMeals,
          onToggleFavorites: onToggleFavorites,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final categoryItem in availableCategories)
          CategoryGridItem(
            categoryItem: categoryItem,
            onSelectCategory: () {
              _selectedCategory(context, categoryItem);
            },
          )
      ],
    );
  }
}
