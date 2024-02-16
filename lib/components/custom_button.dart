import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomButton extends StatefulWidget {
  final Function? onTap;
  final String label;
  final Color color;
  final double? width;
  final Color? texColor;
  const CustomButton(
      {super.key,
      this.onTap,
      required this.label,
      required this.color,
      this.width,
      this.texColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color buttonColor;
  bool isClicable = true;
  bool isClicked = false;
  Timer? _timer;

  @override
  void initState() {
    buttonColor = widget.color;
    super.initState();
  }

  void changeColor() {
    setState(() {
      isClicable = false;
      buttonColor = widget.color.withOpacity(0.3);
      isClicked = !isClicked;
    });

    // Pour Réinitialise la couleur
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 100), () {
      setState(() {
        buttonColor = widget.color;
        isClicked = false;
        isClicable = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeColor();
        widget.onTap?.call();
        print("ok");
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
        alignment: Alignment.center,
        height: 53,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.label,
          style: AppTheme.textStyle(
            color: widget.texColor,
            fontWeight_: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
