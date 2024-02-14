import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/components/animated_logo.dart';
import 'package:quiz_api/screen/quiz_page.dart';
import 'package:quiz_api/theme/app_theme.dart';

import '../provider/game_provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      Provider.of<GameProvider>(context, listen: false).init();
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const QuizPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AnimatedLogo(),
                  const Gap(20),
                  Text(
                    "Loading...",
                    style: AppTheme.textStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight_: AppTheme.semiBold),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
