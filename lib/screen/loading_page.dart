import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_api/components/animated_logo.dart';
import '../components/logo.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: AnimatedLogo(),
          )
        ),
      ),
    );
  }
}
