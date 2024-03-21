class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffledAnswer() {
    final shuffleAnswer = List.of(answers);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}
