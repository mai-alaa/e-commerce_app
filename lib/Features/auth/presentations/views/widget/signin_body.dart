import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/custom_textFormFeiled.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/default_button.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  SignInBody({super.key});

  var emailAddressController = TextEditingController();

  var passwordController = TextEditingController();

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
              const SizedBox(
                height: 50,
              ),
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
              const SizedBox(
                height: 50,
              ),
              DefaultButton(
                text: 'Sign In',
                onPressed: () {},
                icon: null,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                  text: 'Sign In with Google',
                  icon: Icons.person,
                  onPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}
