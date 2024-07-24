import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

var beginVal = Alignment.topLeft;
var endVal = Alignment.bottomRight;

class GradientColor extends StatelessWidget {
  const GradientColor({
    super.key,
    required this.colors,
  });
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: beginVal,
          end: endVal,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
