class QuizQuestions {
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);//copying the list 
    shuffledList.shuffle();//shuffling the list
    return shuffledList;//returning the shuffled list 
  }
}
