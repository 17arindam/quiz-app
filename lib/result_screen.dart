import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen(this.onRestart,{super.key,required this.choosenAnswer});

   void Function() onRestart;

  final List<String> choosenAnswer;
  List<Map<String,Object>> getSummaryData(){
    List<Map<String,Object>> summary =[];

    for(var i=0;i<choosenAnswer.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'choosen_answer':choosenAnswer[i]

      }

      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    var summaryData = getSummaryData();
    final TotalAnswer= questions.length;
    final CorrectAnswer = summaryData.where((data){
      return data['correct_answer']==data['choosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("You Answered $CorrectAnswer out of $TotalAnswer question"),
          SizedBox(height: 30,),
          QuestionSummary(getSummaryData()),
          TextButton(onPressed: onRestart, child: Text("Restart Quiz"))],
        ),
      ),
    );
  }
}
