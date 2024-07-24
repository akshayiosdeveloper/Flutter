import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(99, 240, 236, 236),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Flutter',
          style: TextStyle(color: Colors.white, fontSize: 28.0),
        ),
        const SizedBox(
          height: 80,
        ),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right),
          label: const Text('Start Quiz'),
        ),
      ],
    ));
  }
}
