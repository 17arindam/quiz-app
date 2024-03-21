import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(
                  (((data['question_index']) as int) + 1).toString(),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      SizedBox(
                        height: 5,
                      ),
                      Text(data['choosen_answer'] as String),
                      
                      Text(data['correct_answer'] as String),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
