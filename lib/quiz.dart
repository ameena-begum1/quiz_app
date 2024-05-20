import 'package:f_quiz/data/questions.dart';
import 'package:f_quiz/question_screen.dart';
import 'package:f_quiz/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:f_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; //empty list for storing selcted ans
  var activeScreen = 'start-screen';

  //if we are using conditional operators no ned of init funtion
  //Widget? activeScreen;
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen =  StartScreen(switchScreen);
  // }


  void switchScreen() {
    setState(
      () {
        activeScreen = 'question-screen';
        //activeScreen = const QuestionScreen();//while using init
      },
    );
  }

  void chooseAnswer(String item) {
    //function which add selcted ans
    selectedAnswers.add(item);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 72, 54, 121),
                Color.fromARGB(255, 109, 81, 158),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          //using tenary operator
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
        ),
      ),
    );
  }
}
