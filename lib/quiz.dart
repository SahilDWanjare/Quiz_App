import 'package:flutter/material.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/startScreen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];


  Widget? activeScreen;

  void Function() get onRestart => restartQuiz; //replacing the var datatype with more specific widget datatype ***  & '?' represents that the variable can be null ***

  //to early initailize the switchscreen function ***
  @override
  void initState() {
    // TODO: implement initState
    activeScreen = Startscreen(switchScreen); //here we have passed the switchscreen function as a postional parameter to the Startscreen class
    super.initState();
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length){
      setState((){
        activeScreen = ResultsScreen(selectedAnswer, onRestart);
      });
    }
  }

  //switching function
  void switchScreen(){
    setState((){
      // selectedAnswer = [];
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.purple,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: activeScreen, //since its static we can use const here
        ),
      ),
    );
  }
}
