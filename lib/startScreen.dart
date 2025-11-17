import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.startQuiz,{super.key});  //startQuiz is a postional parameter pointing the switchscreen function in quiz.dart


  final void Function() startQuiz;   //*** void Function() is also a datatype which says that the startQuiz function will not return anything

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image
        Image.asset('Assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(150, 255, 255, 255), //to add transparency / Change the opacity
        ),

        SizedBox(height: 80,),
        // Title
        Text("Learn Flutter the fun way!", style: GoogleFonts.lato(
            color: Color.fromARGB(255, 220, 175, 253),
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
        ),

        SizedBox(height: 50,),
        // Start Button
        OutlinedButton.icon(onPressed: (){
          startQuiz();
        },
          icon: const Icon(Icons.arrow_right_alt),  //hence we use OutlinedButton.icon ***
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          label:const Text("Start Quiz"),
        )

      ],
    );
  }
}
