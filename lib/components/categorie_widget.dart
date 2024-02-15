import 'package:flutter/material.dart';
import 'package:quiz_api/router/app_route.dart';
import 'package:quiz_api/theme/app_theme.dart';

class CategorieWidget extends StatefulWidget {
  final String title;
  final String imgage;
  const CategorieWidget({super.key, required this.title, required this.imgage});

  @override
  State<CategorieWidget> createState() => _CategorieWidgetState();
}

class _CategorieWidgetState extends State<CategorieWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  Navigator.pushNamed(context, AppRoute.loadingPage, arguments: widget.title),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.15),
              spreadRadius: -10,
              blurRadius: 5,
              offset: const Offset(0, 7),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 64,
              width: 64,
              child: Image(image: AssetImage(widget.imgage)),
            ),
            Text(
              widget.title,
              style: AppTheme.textStyle(
                color: AppTheme.primaryColor,
                fontWeight_: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
