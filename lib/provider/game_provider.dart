import 'package:flutter/material.dart';
import 'package:quiz_api/router/app_route.dart';
import 'package:quiz_api/services/api_service.dart';

import '../components/response_tile.dart';
import '../model/question_model.dart';

class GameProvider extends ChangeNotifier {
  int points = 0;
  int score = 0;
  bool canSelected = true;
  int index = 0;
  final List<GlobalKey<ResponseTileState>> responseTileKeys = [
    GlobalKey<ResponseTileState>(),
    GlobalKey<ResponseTileState>(),
    GlobalKey<ResponseTileState>(),
    GlobalKey<ResponseTileState>(),
  ];
  Question? currentQuestion;
  List<Question> questions = [];
  List<Question> questionsTest = [
    Question(
      id: 1,
      question: "Quel est la capitale de la France ?",
      answerA: {"text": "Paris", "isCorrect": true},
      answerB: {"text": "Londres", "isCorrect": false},
      answerC: {"text": "Berlin", "isCorrect": false},
      answerD: {"text": "Madrid", "isCorrect": false},
    ),
    Question(
      id: 2,
      question: "Quel est la plus grande planète du système solaire ?",
      answerA: {"text": "Terre", "isCorrect": false},
      answerB: {"text": "Jupiter", "isCorrect": true},
      answerC: {"text": "Saturne", "isCorrect": false},
      answerD: {"text": "Mars", "isCorrect": false},
    ),
    Question(
      id: 3,
      question: "Qui a peint la Joconde ?",
      answerA: {"text": "Leonard de Vinci", "isCorrect": true},
      answerB: {"text": "Vincent Van Gogh", "isCorrect": false},
      answerC: {"text": "Pablo Picasso", "isCorrect": false},
      answerD: {"text": "Claude Monet", "isCorrect": false},
    ),
    Question(
      id: 4,
      question: "Quel est l'océan le plus grand du monde ?",
      answerA: {"text": "Océan Atlantique", "isCorrect": false},
      answerB: {"text": "Océan Pacifique", "isCorrect": true},
      answerC: {"text": "Océan Indien", "isCorrect": false},
      answerD: {"text": "Océan Arctique", "isCorrect": false},
    ),
    Question(
      id: 5,
      question: "Quel est le symbole chimique de l'eau ?",
      answerA: {"text": "H2O", "isCorrect": true},
      answerB: {"text": "O2", "isCorrect": false},
      answerC: {"text": "CO2", "isCorrect": false},
      answerD: {"text": "NH3", "isCorrect": false},
    ),
    Question(
      id: 6,
      question: "Quel est le président actuel des États-Unis ?",
      answerA: {"text": "Barack Obama", "isCorrect": false},
      answerB: {"text": "Joe Biden", "isCorrect": true},
      answerC: {"text": "Donald Trump", "isCorrect": false},
      answerD: {"text": "George W. Bush", "isCorrect": false},
    ),
    Question(
      id: 7,
      question: "Quel est le plus grand désert du monde ?",
      answerA: {"text": "Le Sahara", "isCorrect": false},
      answerB: {"text": "Le désert de Gobi", "isCorrect": false},
      answerC: {"text": "L'Antarctique", "isCorrect": true},
      answerD: {"text": "Le désert d'Arabie", "isCorrect": false},
    ),
    Question(
      id: 8,
      question: "Combien de continents y a-t-il sur Terre ?",
      answerA: {"text": "Cinq", "isCorrect": false},
      answerB: {"text": "Six", "isCorrect": false},
      answerC: {"text": "Sept", "isCorrect": true},
      answerD: {"text": "Huit", "isCorrect": false},
    ),
    Question(
      id: 9,
      question: "Quel est l'inventeur de la théorie de la relativité ?",
      answerA: {"text": "Isaac Newton", "isCorrect": false},
      answerB: {"text": "Galilée", "isCorrect": false},
      answerC: {"text": "Albert Einstein", "isCorrect": true},
      answerD: {"text": "Marie Curie", "isCorrect": false},
    ),
    Question(
      id: 10,
      question: "Quel est le plus haut sommet du monde ?",
      answerA: {"text": "Mont Everest", "isCorrect": true},
      answerB: {"text": "Mont Kilimandjaro", "isCorrect": false},
      answerC: {"text": "Mont Blanc", "isCorrect": false},
      answerD: {"text": "Mont McKinley", "isCorrect": false},
    ),
  ];

  Future<void> init({required String categorie}) async {
    questions = await ApiService.getQuestionByCaterory(categorie) ??
        await ApiService.getRandomQuestion() ??
        questionsTest;
    score = 0;
    canSelected = true;
    index = 0;
    currentQuestion = questions[index];
  }

  void nextQuestion({required BuildContext context}) {
    if (index < 9) {
      canSelected = true;
      for (var element in responseTileKeys) {
        element.currentState!.init();
      }
      if (index < questions.length) {
        index++;
        currentQuestion = questions[index];
        notifyListeners();
      }
    } else if (index == 9) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoute.scorePage, (route) => false,
          arguments: score);
    }
  }

  //Fonction qui se lance quand le user choisie une reponse
  void corrector() {
    for (var element in responseTileKeys) {
      element.currentState!.correction();
    }
    notifyListeners();
  }

  void playAgain({required BuildContext context}) {
    score = 0;
    canSelected = true;
    index = 0;
    currentQuestion = questions[index];
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoute.quizPage, (route) => false);
  }

  void addScore() {
    score++;
    notifyListeners();
  }
}
