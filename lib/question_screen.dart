import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelect});

  final void Function(String answer) onSelect;

  

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onSelect(answer);
    setState(() {
      if(currentQuestionIndex<questions.length){

      currentQuestionIndex++;
      
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          ...currentQuestion.shuffledAnswer().map((answer) {
            return AnswerButton(text: answer, onTap: (){
              answerQuestion(answer);
            });
          })
        ],
      ),
    );
  }
}
