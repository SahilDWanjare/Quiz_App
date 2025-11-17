class QuizQuestion{
  const QuizQuestion(this.text, this.answers);  //constructor for the QuizQuestion class

  final String text;
  final List<String> answers;

  List<String> getShuffeledAnswers(){
    final shuffledList= List.of(answers);  //list. of is used to create a copy of the list *** so that the original list will not be altered as we want to know the first option as correct answer😉
    shuffledList.shuffle();   //shuffling the list
    return shuffledList;
  }
}

