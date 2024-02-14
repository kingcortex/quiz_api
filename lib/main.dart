import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/provider/game_provider.dart';
import 'package:quiz_api/router/app_route.dart';
import 'package:quiz_api/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameProvider(),
        )
      ],
      child: MaterialApp(
        onGenerateRoute: onGenerateRoute,
        title: 'Flutter Demo',
        theme: AppTheme.themeData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
