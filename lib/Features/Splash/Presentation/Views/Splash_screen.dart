import 'package:ecommerce_app/Features/Splash/Presentation/Views/widgets/splash_screen_body.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KPrimaryColor,
      body: SplashScreenBody(),
    );
  }
}
