import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/provider/game_provider.dart';

import '../theme/app_theme.dart';

class ResponseTile extends StatefulWidget {
  final Map<String, dynamic> answer;
  const ResponseTile({super.key, required this.answer});

  @override
  State<ResponseTile> createState() => ResponseTileState();
}

class ResponseTileState extends State<ResponseTile> {
  bool isSelected = false;
  bool isSelectedCheckbox = false;
  void active() {
    setState(() {
      isSelected = !isSelected;
      isSelectedCheckbox = !isSelectedCheckbox;
    });
  }

  void correction() {
    if (widget.answer["isCorrect"]) {
      isSelected = true;
    }
  }

  void init() {
    setState(() {
      isSelected = false;
      isSelectedCheckbox = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // couleur en fonction de la reponse
    Color activeColor = widget.answer["isCorrect"]
        ? const Color(0xffABD1C6)
        : const Color(0xffEF9A9A);
    return Padding(
      padding: EdgeInsets.only(bottom: AppTheme.screenHeight(context) * 0.026),
      child: Consumer<GameProvider>(builder: (context, gameProvider, child) {
        return GestureDetector(
          onTap: () {
            if (gameProvider.canSelected) {
              active();
              gameProvider.canSelected = false;
              if (widget.answer["isCorrect"] == false) {
                gameProvider.corrector();
              } else {
                gameProvider.addScore();
              }
            }
          },
          child: AnimatedContainer(
            duration: const Duration(microseconds: 500),
            curve: Curves.bounceInOut,
            padding: EdgeInsets.symmetric(
              vertical: AppTheme.screenHeight(context) * 0.00,
              horizontal: AppTheme.screenHeight(context) * 0.03,
            ),
            //height: AppTheme.screenHeight(context) * 0.056,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      24 -
                      AppTheme.screenHeight(context) * 0.138,
                  child: Text(
                    widget.answer["text"] ?? "<EMPTY>",
                    style: AppTheme.textStyle(
                      color: Colors.black,
                      fontWeight_: AppTheme.semiBold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Checkbox(
                  activeColor: AppTheme.primaryColor,
                  side: const BorderSide(
                    color: Color(0xff000000),
                    width: 1,
                  ),
                  shape: const CircleBorder(),
                  value: isSelectedCheckbox,
                  onChanged: (bool? value) {},
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
