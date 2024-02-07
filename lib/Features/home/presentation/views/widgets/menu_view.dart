import 'package:ecommerce_app/Core/network/local/cache_helper.dart';
import 'package:ecommerce_app/Core/utils/functions/navigation.dart';
import 'package:ecommerce_app/Core/widgets/default_button.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_in_screen.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultButton(
          onPressed: () {
            CacheHelper.removeData(
              key: 'uId',
            ).then((value) {
              if (value) {
                navigateTo(context, SignInScreen(), Duration(milliseconds: 1));
              }
            });
          },
          text: 'Log Out',
          image: null,
        ),
      ),
    );
  }
}
