import 'package:flutter/material.dart';
import 'package:quiz_api/theme/app_theme.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInCirc))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller
              .reverse(); // Inverse l'animation une fois qu'elle est terminée
        } else if (status == AnimationStatus.dismissed) {
          controller
              .forward(); // Relance l'animation une fois qu'elle est inversée
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.scale(
            scale: animation.value,
            child: Container(
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
                        fontWeight_: AppTheme.semiBold),
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
            ),
          );
        });
  }
}
