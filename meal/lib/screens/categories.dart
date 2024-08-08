import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/categoryitem.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectedCategory(BuildContext context, CategoryItem categoryItem) {
    var filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryItem.id))
        .toList();
    print(filteredMeals.first.categories);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: categoryItem.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: GridView(
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
        ));
  }
}
