import 'package:flutter/material.dart';
import 'package:quiz_api/theme/app_theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        color: AppTheme.primeryTextColor,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Text(
            "Quiz",
            style: AppTheme.textStyle(
              color: AppTheme.primaryColor,
              fontSize: 40,
              fontWeight_: AppTheme.semiBold,
            ),
          ),
          Transform.translate(
            offset: const Offset(50, 35),
            child: Text(
              "Api",
              style: AppTheme.textStyle(
                  color: AppTheme.yellow,
                  fontSize: 20,
                  fontWeight_: AppTheme.semiBold),
            ),
          )
        ],
      ),
    );
  }
}
