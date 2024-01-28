import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_in_screen.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_up_screen.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Don\'t have an account?',
          style: Styles.labeltext,
        ),
        TextButton(
            onPressed: () {
              navigateTo();
            },
            child: Text(
              'Sign Up',
              style: Styles.labeltext.copyWith(color: const Color(0xFF70CBFF)),
            ))
      ],
    );
  }
}

void navigateTo() {
  Future.delayed(const Duration(seconds: 1), () {
    Get.to(const SignUpScreen(),
        transition: Transition.fade, duration: KTransitionDurations);
  });
}
