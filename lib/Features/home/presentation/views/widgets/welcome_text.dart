import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hey!',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: KPrimaryColor),
    );
  }
}
