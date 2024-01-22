import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsData.backgroundSign,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            const Text(
              'Welcome Back!',
              style: Styles.signInHead,
            ),
            const Text(
              'Sign in to continue',
              style: Styles.signInsubtitle,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(),
          ],
        ),
      ],
    );
  }
}
