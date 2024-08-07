import 'package:flutter/material.dart';
import 'package:meal/models/categoryitem.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.categoryItem,
  });
  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              categoryItem.color.withOpacity(0.55),
              categoryItem.color.withOpacity(0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
        child: Text(
          categoryItem.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
    );
  }
}
