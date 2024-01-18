import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Center(
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width * .85,
                height: MediaQuery.sizeOf(context).height * 1,
                child: const Image(image: AssetImage(AssetsData.logo))),
          ),
        );
      },
      animation: slidingAnimation,
    );
  }
}
