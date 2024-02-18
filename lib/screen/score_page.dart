import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/components/custom_button.dart';
import 'package:quiz_api/provider/game_provider.dart';
import 'package:quiz_api/router/app_route.dart';
import 'package:quiz_api/theme/app_theme.dart';

class ScorePage extends StatefulWidget {
  final int score;
  const ScorePage({super.key, required this.score});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

String getPercentageScore(int score) {
  double percentage = ((score / 10) * 100);
  return "${percentage.round()} %";
}

String getQuizResult(int score) {
  if (score < 5) {
    return "Failed! Better luck next time.";
  } else if (score >= 5 && score < 8) {
    return "Passed with distinction! Keep up the good work.";
  } else {
    return "Excellent! You deserve a pat on the back.";
  }
}

class _ScorePageState extends State<ScorePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: widget.score / 10)
        .animate(animationController);

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Pour que ce soit responsive
    double rectangleHeight = MediaQuery.of(context).size.height * 0.60;
    double rectangleWidth = MediaQuery.of(context).size.width - 24;
    int score = Provider.of<GameProvider>(context, listen: true).score;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.only(
                top: AppTheme.screenHeight(context) * 0.0922 / 2),
            padding: EdgeInsets.symmetric(
                vertical: rectangleWidth * 0.06,
                horizontal: rectangleWidth * 0.06),
            height: rectangleHeight,
            width: rectangleWidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: rectangleWidth * 0.12,
                      width: rectangleWidth * 0.12,
                      child: const Image(
                          image: AssetImage("assets/icon_app/qualite.png")),
                    ),
                    Text(
                      "Resultat",
                      style: AppTheme.textStyle(
                        color: AppTheme.primaryColor,
                        fontSize: rectangleWidth * 0.09,
                        fontWeight_: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: rectangleWidth * 0.12,
                      width: rectangleWidth * 0.12,
                      child: const Image(
                          image: AssetImage("assets/icon_app/qualite.png")),
                    )
                  ],
                ),
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
                Text(
                  getQuizResult(score),
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyle(
                    color: AppTheme.primaryColor,
                    fontSize: rectangleWidth * 0.06,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        width: 100,
                        onTap: () {
                          Provider.of<GameProvider>(context, listen: false).points =
                              Provider.of<GameProvider>(context, listen: false).points + score;
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoute.home, (route) => false);
                        },
                        label: "Go To Home",
                        texColor: AppTheme.primaryColor,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: CustomButton(
                        width: 100,
                        onTap: () {
                          Provider.of<GameProvider>(context, listen: false)
                              .playAgain(context: context);
                        },
                        label: "Play Again",
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
