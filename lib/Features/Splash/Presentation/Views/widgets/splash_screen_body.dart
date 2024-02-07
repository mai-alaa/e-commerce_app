import 'package:ecommerce_app/Core/network/local/cache_helper.dart';
import 'package:ecommerce_app/Features/Splash/Presentation/Views/widgets/SlidingImage.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_in_screen.dart';

import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_bottom_nav.dart';

import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateTo();
  }

  void navigateTo() {
    var uId = CacheHelper.getData(key: 'uId');
    if (uId == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(const SignInScreen(),
            transition: Transition.fade, duration: KTransitionDurations);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(const LayoutScreen(),
            transition: Transition.fade, duration: KTransitionDurations);
      });
    }
  }

  void initSlidingAnimation() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingImage(slidingAnimation: slidingAnimation);
  }
}
