import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // const AnswerButton(this.answer,this.onTap,{super.key});//positional arguments
  const AnswerButton(
      {required this.answer, required this.onTap, super.key}); //named arguments

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 1, 7, 92),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
