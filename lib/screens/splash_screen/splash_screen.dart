import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      //     () => Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      // ),
      () => Get.offAll(() => const OnboardingScreen()),
    );

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Image.asset('assets/images/IMG-20250729-WA0169.jpg',fit: BoxFit.cover,width: double.infinity,)), 
    );
  }
}