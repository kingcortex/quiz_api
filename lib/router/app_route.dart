import 'package:flutter/material.dart';
import 'package:quiz_api/router/custom_page_route.dart';
import 'package:quiz_api/screen/home_page.dart';
import 'package:quiz_api/screen/login_page.dart';
import 'package:quiz_api/screen/quiz_page.dart';
import 'package:quiz_api/screen/splash_screen.dart';

import '../screen/loading_page.dart';
import '../screen/score_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case AppRoute.loadingPage:
      return CustomPageRoute(
          child: LoadingPage(
        categorie: settings.arguments as String,
      ));
      return MaterialPageRoute(
          builder: (context) => LoadingPage(
                categorie: settings.arguments as String,
              ));
    case AppRoute.login:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case AppRoute.home:
      return CustomPageRoute(child: const HomePage());
    //return MaterialPageRoute(builder: (context) => const HomePage());
    case AppRoute.quizPage:
      return CustomPageRoute(child: const QuizPage());
    //return MaterialPageRoute(builder: (context) => const QuizPage());
    case AppRoute.scorePage:
      return CustomPageRoute(
          child: ScorePage(score: settings.arguments as int));
    /*  return MaterialPageRoute(
          builder: (context) => ScorePage(
                score: settings.arguments as int,
              ));**/
    default:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
  }
}

class AppRoute {
  static const String splashScreen = "/";
  static const String home = "/home";
  static const String login = "/login";
  static const String quizPage = "/quiz_page";
  static const String loadingPage = "loading_page";
  static const String scorePage = "score_page";
}
