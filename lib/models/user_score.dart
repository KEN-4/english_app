class UserScore {
  int conversation = 0;
  int listening = 0;
  int grammar = 0;
  int vocabulary = 0;

  void addScore(Map<String, int> score) {
    conversation += score['conversation'] ?? 0;
    listening += score['listening'] ?? 0;
    grammar += score['grammar'] ?? 0;
    vocabulary += score['vocabulary'] ?? 0;
  }
}