import 'package:flutter/material.dart';

class CustomDescription extends StatelessWidget {
  final String textDes;
  const CustomDescription({super.key, required this.textDes});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: textDes,
        style: const TextStyle(
          color: Color(0xFF7F7A7B),
          fontSize: 14,
          fontFamily: 'Kanit',
          fontWeight: FontWeight.w300,
          height: 0,
        ),
      ),
    );
  }
}
