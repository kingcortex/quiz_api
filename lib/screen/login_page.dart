import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_api/theme/app_theme.dart';

import '../components/custom_labe.dart';
import '../components/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              const CustomLabel(
                labelText: "Enter your name",
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 53,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Strart",
                  style: AppTheme.textStyle(fontWeight_: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
