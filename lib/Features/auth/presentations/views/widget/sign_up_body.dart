import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/background_auth.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/custom_textFormFeiled.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/default_button.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  SignUpBody({super.key});

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
                'Welcome In AEB Store!',
                style: Styles.signInHead,
              ),
              const Text(
                'Please Enter Your Details',
                style: Styles.signInsubtitle,
              ),
              space50,
              CustomTextFormFeiled(
                controller: nameController,
                type: TextInputType.name,
                label: 'Name',
                prefix: Icons.person,
                validate: (value) {},
              ),
              space30,
              CustomTextFormFeiled(
                controller: emailAddressController,
                type: TextInputType.emailAddress,
                label: 'Email Address',
                prefix: Icons.email,
                validate: (value) {},
              ),
              space30,
              CustomTextFormFeiled(
                controller: passwordController,
                type: TextInputType.emailAddress,
                label: 'Password',
                prefix: Icons.password,
                validate: (value) {},
              ),
              space30,
              CustomTextFormFeiled(
                controller: phoneController,
                type: TextInputType.phone,
                label: 'Password',
                prefix: Icons.phone_android,
                validate: (value) {},
              ),
              space50,
              DefaultButton(text: 'Sign Up', onPressed: () {}, image: null)
            ],
          ),
        ),
      ],
    );
  }
}