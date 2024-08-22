import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/onboarding/onboardingPage.dart';
import 'package:weatherapp/view/detailsPage.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      routes: {
        "homepage": (context)=>Homepage(),
        "detailspage": (context)=>Detailspage(),
      },
    );
  }
}
