class Question {
  final int id;
  final String question;
  final Map<String, dynamic> answerA;
  final Map<String, dynamic> answerB;
  final Map<String, dynamic> answerC;
  final Map<String, dynamic> answerD;

  Question({
    required this.id,
    required this.question,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
  });
}
