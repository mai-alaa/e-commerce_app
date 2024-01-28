import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/background_auth.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/custom_textFormFeiled.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/default_button.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/new_account_button.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                onPressed: () {},
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
              const NewAccount()
            ],
          ),
        ),
      ],
    );
  }
}
