import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
   const StartScreen(this.startQuiz,{super.key});
   final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: Color.fromARGB(115, 255, 255, 255),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Learn Flutter the fun way!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: Text('Start Quiz'),
              icon: Icon(Icons.arrow_right_alt),
            )
          ],
        
    
    );
  }
}
