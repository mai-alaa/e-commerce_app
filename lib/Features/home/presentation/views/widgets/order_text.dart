import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class OrderText extends StatelessWidget {
  const OrderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Let\'s get your order.',
      style: TextStyle(
          fontSize: 13, fontWeight: FontWeight.bold, color: KSecColor),
    );
  }
}
