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

  factory Question.fromJson(dynamic json) {
    bool getBool(String? value) {
      if (value == "true") {
        return true;
      } else if (value == "false") {
        return false;
      }
      return false;
    }

    int id_ = json['id'] as int;

    String question_ = json['question'];

    Map<String, dynamic> answerA_ = {
      "text": json['answers']['answer_a'] as String,
      "isCorrect": getBool(json['correct_answers']['answer_a_correct'])
    };

    Map<String, dynamic> answerB_ = {
      "text": json['answers']['answer_b'] as String,
      "isCorrect": getBool(json['correct_answers']['answer_b_correct'])
    };

    Map<String, dynamic> answerC_ = {
      "text": json['answers']['answer_c'],
      "isCorrect": getBool(json['correct_answers']['answer_c_correct'])
    };

    Map<String, dynamic> answerD_ = {
      "text": json['answers']['answer_d'],
      "isCorrect": getBool(json['correct_answers']['answer_d_correct'])
    };

    return Question(
      id: id_,
      question: question_,
      answerA: answerA_,
      answerB: answerB_,
      answerC: answerC_,
      answerD: answerD_,
    );
  }
}
