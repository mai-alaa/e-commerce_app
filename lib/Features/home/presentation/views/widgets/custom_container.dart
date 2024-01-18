import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 52,
        height: 45,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 6.80,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: child);
  }
}
