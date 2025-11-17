import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;


  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // currentQuestionIndex = currentQuestionIndex + 1;
      // currentQuestionIndex += 1;
      currentQuestionIndex++; // All are same😉
    });

  }

  @override
  Widget build(BuildContext context) {
    //questions
    final current_question = questions[currentQuestionIndex];
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Question text
          Text(current_question.text,
            style: GoogleFonts.lato(   //.font_name ***
              color: Color.fromARGB(255, 213, 158, 255),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
                textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30,),

          ...current_question.getShuffeledAnswers().map((answer){  //dynamically creating the answer buttons based on the number of answers
            return AnswerButton(answer, (){
              answerQuestion(answer);
            });
          })

        ],
      ),
    );
  }
}
