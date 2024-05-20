import 'package:f_quiz/data/questions.dart';
import 'package:f_quiz/question_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers,required this.onRestart});
  final void Function() onRestart;

  final List<String> choosenAnswers;
  List<Map<String, Object>> getDataSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getDataSummary();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.afacad(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                onPressed: onRestart,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 187, 178, 178),
                ),
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text(
                  'Restart Quiz!',
                ))
          ],
        ),
      ),
    );
  }
}
