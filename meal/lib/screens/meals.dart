import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/data/meal.dart';
import 'package:meal/screens/meals_details.dart';
import 'package:meal/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorites});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorites;

  void selectMeal(BuildContext context, Meal meal) {
    print('Meals screens🍔');
    print('togle:${onToggleFavorites}');
    final mealDetailScreen = MaterialPageRoute(
      builder: (ctx) => MealsDetails(
        meal: meal,
        onToggleFavorites: onToggleFavorites,
      ),
    );
    Navigator.of(context).push(mealDetailScreen);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => Text(meals[index].title),
    );
    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("No data availabele"),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Try selecting different category",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (context, meal) => selectMeal(context, meal),
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
      backgroundColor: Colors.white,
    );
  }
}
