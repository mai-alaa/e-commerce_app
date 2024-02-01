import 'package:ecommerce_app/Features/auth/presentations/views/widget/signin_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInBody(),
    );
  }
}
