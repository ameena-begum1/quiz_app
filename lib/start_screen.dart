import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.8,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 400,
          //   ),
          // ),

          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(232, 0, 0, 0),
          ),

          const SizedBox(
            height: 40,
          ),
          Text(
            'Learn Flutter The Fun Way',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign :TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
            icon: const Icon(Icons.arrow_circle_right),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
