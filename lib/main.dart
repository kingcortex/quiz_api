import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/provider/game_provider.dart';
import 'package:quiz_api/theme/app_theme.dart';

import 'screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.themeData(),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
