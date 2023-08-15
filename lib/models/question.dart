class Question {
  final String audioUrl;
  final List<String> choices;
  final String answer;
  final Map<String, int> scores;

  Question({required this.audioUrl, required this.choices, required this.answer, required this.scores});
}
