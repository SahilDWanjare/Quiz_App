import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.onRestart,{super.key});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  //list can bbe assigned to any data type either a built-in datatype or a custom datatype
  List<Map<String, Object>> getSummaryData(){  //Since all the datatypes are objects afterall so we can assign any datatype using Object
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],  // since the 1st answer is always the correct one
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;

  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
        margin: EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 230, 200, 253),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        SizedBox(height: 30,),
        QuestionsSummary(summaryData),
        SizedBox(height: 30,),
        TextButton.icon(onPressed: onRestart,
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.refresh),
            label: Text("Restart Quiz"),
        ),
      ]
    )
    );
  }
}
