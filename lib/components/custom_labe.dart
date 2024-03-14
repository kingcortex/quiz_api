import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_api/theme/app_theme.dart';

class CustomTexField extends StatefulWidget {
  final String labelText;
  const CustomTexField({super.key, required this.labelText});

  @override
  State<CustomTexField> createState() => _CustomLabelState();
}

class _CustomLabelState extends State<CustomTexField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.labelText, style: AppTheme.textStyle()),
            ],
          ),
          Container(
            height: 53,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppTheme.primeryTextColor, width: 2),
                bottom: BorderSide(color: AppTheme.primeryTextColor),
                left: BorderSide(color: AppTheme.primeryTextColor),
                right: BorderSide(color: AppTheme.primeryTextColor),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextField(
                keyboardType: TextInputType.name,
                style: AppTheme.textStyle(),
                cursorColor: AppTheme.primeryTextColor,
                decoration: InputDecoration(
                  labelStyle: AppTheme.textStyle(),
                  hintText: "John Deh...",
                  hintStyle: AppTheme.textStyle(fontWeight_: FontWeight.normal),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                ),
              ),
            ),
          ),
          const Gap(150),
        ],
      ),
    );
  }
}
