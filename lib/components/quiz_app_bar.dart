import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/provider/game_provider.dart';

import '../theme/app_theme.dart';
import 'previous_button.dart';

class QuizAppBar extends StatefulWidget {
  const QuizAppBar({super.key});

  @override
  State<QuizAppBar> createState() => _QuizAppBarState();
}

class _QuizAppBarState extends State<QuizAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gameProvider, child) {
      return Row(
        children: [
          previousButton(context: context),
          const Gap(90),
          Text(
            "${gameProvider.index + 1}/10",
            style: AppTheme.textStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight_: AppTheme.semiBold,
            ),
          )
        ],
      );
    });
  }
}
