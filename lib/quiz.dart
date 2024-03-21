import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  List<String> selectedAnswer = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    
    setState(() {
      activeScreen =  QuestionScreen(onSelect: selectedOption);
    });
  }

  void restartQuiz(){
    selectedAnswer = [];
    setState(() {
      
    activeScreen = StartScreen(switchScreen);
    });
  }

  void selectedOption(String answer){
    
    
    selectedAnswer.add(answer);
    

    if(selectedAnswer.length==questions.length){
      
      setState(() {
        activeScreen = ResultScreen(choosenAnswer: selectedAnswer,restartQuiz);
      });
    }
    

  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(25, 5, 97, 1),
              Color.fromARGB(255, 56, 9, 137)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
