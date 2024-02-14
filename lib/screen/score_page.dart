import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/components/custom_button.dart';
import 'package:quiz_api/provider/game_provider.dart';
import 'package:quiz_api/router/app_route.dart';
import 'package:quiz_api/theme/app_theme.dart';

class ScorePage extends StatefulWidget {
  final int score;
  const ScorePage({super.key,  required this.score});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

/// calcule et convertion des resultat afin de les assigner aux [buildTitleText].
String getCorrect(int score) {
  return score.toString();
}

String getWrong(int score) {
  return (10 - score).toString();
}

String getPercentageScore(int score) {
  double percentage = ((score / 10) * 100);
  return "${percentage.round()} %";
}

class _ScorePageState extends State<ScorePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: widget.score / 10)
        .animate(animationController);

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Pour que ce soit responsive
    double rectangleHeight = MediaQuery.of(context).size.height * 0.24;
    double rectangleWidth = MediaQuery.of(context).size.width - 24;
    int score = Provider.of<GameProvider>(context, listen: true).score;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.primeryTextColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Better Luck Next Time",
                  style: AppTheme.textStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight_: FontWeight.w700),
                ),
              ],
            ),
            const Gap(30),
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return CircularProgressIndicator(
                          color: AppTheme.primaryColor,
                          backgroundColor: const Color(0xffABD1C6),
                          value: animation.value,
                          strokeWidth: 6,
                          strokeCap: StrokeCap.round,
                        );
                      }),
                  Center(
                    child: Text(
                      getPercentageScore(score),
                      style: AppTheme.textStyle(
                        color: AppTheme.primaryColor,
                        fontWeight_: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: AppTheme.screenHeight(context) * 0.0922 / 2),
              padding: EdgeInsets.symmetric(
                  vertical: rectangleWidth * 0.06,
                  horizontal: rectangleWidth * 0.06),
              height: rectangleHeight,
              width: rectangleWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.15),
                    spreadRadius: -10,
                    blurRadius: 50,
                    offset: const Offset(0, 7),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitleText(
                        text: 'Score',
                        value: getPercentageScore(score),
                        color: Colors.amber,
                      ),
                      Gap(rectangleWidth * 0.025),
                      buildTitleText(
                        text: 'Correct',
                        value: getCorrect(score),
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitleText(
                        text: 'Total Question',
                        value: '10',
                        color: Colors.brown,
                      ),
                      Gap(rectangleWidth * 0.025),
                      buildTitleText(
                        value: getWrong(score),
                        text: 'Wrong',
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoute.login, (route) => false);
              },
              label: "Go To Home",
              color: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTitleText(
    {required String text, required String value, required Color color}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          DecoratedBox(
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: color,
            ),
            child: const SizedBox(
              width: 20,
              height: 20,
            ),
          ),
          const Gap(3),
          Text(
            value,
            style: AppTheme.textStyle(
              color: color,
              fontSize: 18,
            ),
          )
        ],
      ),
      Text(
        text,
        style: AppTheme.textStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight_: FontWeight.w300,
        ),
      )
    ],
  );
}
