import 'package:flutter/material.dart';
import 'package:meal/data/meal.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails(
      {super.key, required this.meal, required this.onToggleFavorites});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorites;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  print("meals_details_screen");
                  onToggleFavorites(meal);
                },
                icon: const Icon(Icons.star))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Ingredients",
                style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: const TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "=========Steps=========",
                style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
              for (final ingredient in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    ingredient,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.white,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
