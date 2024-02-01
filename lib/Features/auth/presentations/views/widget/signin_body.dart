import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/functions/navigation.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_in_screen.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_up_screen.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/background_auth.dart';
import 'package:ecommerce_app/Core/widgets/custom_textFormFeiled.dart';
import 'package:ecommerce_app/Core/widgets/default_button.dart';
import 'package:ecommerce_app/Core/widgets/default_textButton.dart';
import 'package:ecommerce_app/Features/home/presentation/views/home_screen_view.dart';

import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInBody extends StatelessWidget {
  SignInBody({super.key});

  var emailAddressController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundAuth(),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: Styles.signInHead,
                  ),
                  const Text(
                    'Sign in to continue',
                    style: Styles.signInsubtitle,
                  ),
                  space50,
                  CustomTextFormFeiled(
                    controller: emailAddressController,
                    type: TextInputType.emailAddress,
                    label: 'Email Address',
                    prefix: Icons.email,
                    validate: (value) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormFeiled(
                    controller: passwordController,
                    type: TextInputType.emailAddress,
                    label: 'Password',
                    prefix: Icons.password,
                    validate: (value) {},
                  ),
                  space50,
                  DefaultButton(
                    text: 'Sign In',
                    onPressed: () {
                      navigateTo(context, const HomeScreen(),
                          const Duration(microseconds: 1));
                    },
                    image: null,
                  ),
                  spacehight,
                  DefaultButton(
                    text: 'Sign In with Google',
                    onPressed: () {},
                    image: AssetsData.googleIcon,
                  ),
                  spacehight,
                  const Row(
                    children: [
                      Expanded(flex: 3, child: Divider()),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'OR',
                            style: Styles.signInsubtitle,
                          ),
                        ),
                      ),
                      Expanded(flex: 3, child: Divider())
                    ],
                  ),
                  spacehight,
                  DefaultButton(
                    text: 'Continue as a guest',
                    onPressed: () {},
                    image: null,
                    buttonColor: Colors.black,
                  ),
                  DefaultTextButton(
                    text: 'Don\'t have an account?',
                    presstext: 'Sign Up',
                    function: () {
                      navigateTo(context, const SignUpScreen(),
                          const Duration(milliseconds: 1));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
