import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenWidth,
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ),
          Positioned(
            left: -screenWidth * 0.29,
            top: -screenHeight * 0.23,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.03),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.63897,
                height: MediaQuery.sizeOf(context).height * 0.91,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 34,
                      offset: Offset(0, 8),
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
