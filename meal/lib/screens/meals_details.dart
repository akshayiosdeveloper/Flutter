import 'package:flutter/material.dart';
import 'package:meal/data/meal.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Column(
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
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "=========Steps=========",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            for (final ingredient in meal.steps)
              Text(
                ingredient,
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              )
          ],
        ));
  }
}
