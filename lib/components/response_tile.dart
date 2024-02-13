import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ResponseTile extends StatefulWidget {
  final Map<String, dynamic> answer;
  const ResponseTile({super.key, required this.answer});

  @override
  State<ResponseTile> createState() => _ResponseTileState();
}

class _ResponseTileState extends State<ResponseTile> {
  bool isSelected = false;
  void active() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor = widget.answer["isCorrect"]
        ? const Color(0xffABD1C6)
        : const Color(0xffEF9A9A);
    return Padding(
      padding: EdgeInsets.only(bottom: AppTheme.screenHeight(context) * 0.026),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 500),
          curve: Curves.bounceInOut,
          padding: EdgeInsets.symmetric(
            vertical: AppTheme.screenHeight(context) * 0.01,
            horizontal: AppTheme.screenHeight(context) * 0.03,
          ),
          height: AppTheme.screenHeight(context) * 0.056,
          width: MediaQuery.of(context).size.width - 24,
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.answer["text"],
                style: AppTheme.textStyle(
                    color: Colors.black,
                    fontWeight_: AppTheme.semiBold,
                    fontSize: 14),
              ),
              Checkbox(
                activeColor: AppTheme.primaryColor,
                side: const BorderSide(
                  color: Color(0xff000000),
                  width: 1,
                ),
                shape: const CircleBorder(),
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
