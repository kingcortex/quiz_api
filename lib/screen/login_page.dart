import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_api/router/app_route.dart';
import 'package:quiz_api/theme/app_theme.dart';

import '../components/custom_button.dart';
import '../components/custom_labe.dart';
import '../components/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              const Logo(),
              const CustomTexField(
                labelText: "Enter your name",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomButton(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, AppRoute.home);
                  },
                  label: "Start",
                  color: AppTheme.yellow,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
