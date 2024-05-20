import 'package:f_quiz/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:f_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelectAnswer});
  final void Function(String item) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestions(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]; //objet
    return SizedBox(
      //alternate of center
      width: double.infinity, //cover full possible screen
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //when using sizedbox to cover the full screen
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text, //to access questions
              style:GoogleFonts.afacad(
                color : Colors.white,
                fontSize :28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                  answer: item,
                  onTap: () {
                    answerQuestions(item);
                  }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
