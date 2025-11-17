import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 89, 8, 103),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
          elevation: 10,
      ),
      child: Text(answerText, textAlign: TextAlign.center,),
    );

  }
}
