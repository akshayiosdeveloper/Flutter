import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientColor(
          colors: [
            Color.fromARGB(74, 0, 0, 0),
            Color.fromARGB(171, 34, 217, 211)
          ],
        ),
      ),
    ),
  );
}
