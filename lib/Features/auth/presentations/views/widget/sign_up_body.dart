import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Core/utils/functions/navigation.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/auth/presentations/manager/cubit/user_data_cubit.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_in_screen.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/background_auth.dart';
import 'package:ecommerce_app/Core/widgets/custom_textFormFeiled.dart';
import 'package:ecommerce_app/Core/widgets/default_button.dart';
import 'package:ecommerce_app/Core/widgets/default_textButton.dart';
import 'package:ecommerce_app/Features/home/presentation/views/home_screen_view.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatelessWidget {
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(),
      child: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          if (state is CreateUserSucessState) {
            navigateTo(context, const HomeScreen());
          }
          if (state is CreateUserFailureState) {
            print('Failed to create account');
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              const BackgroundAuth(),
              Form(
                key: formKey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SingleChildScrollView(
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
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          space30,
                          CustomTextFormFeiled(
                            controller: emailAddressController,
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            prefix: Icons.email,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          space30,
                          CustomTextFormFeiled(
                            controller: passwordController,
                            type: TextInputType.emailAddress,
                            label: 'Password',
                            prefix: Icons.password,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          space30,
                          CustomTextFormFeiled(
                            controller: phoneController,
                            type: TextInputType.phone,
                            label: 'Phone Number',
                            prefix: Icons.phone_android,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Phone Number';
                              }
                              return null;
                            },
                          ),
                          space50,
                          ConditionalBuilder(
                            builder: (context) {
                              return DefaultButton(
                                  text: 'Sign Up',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      UserDataCubit.get(context).userRegister(
                                        email: emailAddressController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        phone: phoneController.text,
                                      );
                                    }
                                  },
                                  image: null);
                            },
                            condition: state is! CreateUserLoadingState,
                            fallback: (BuildContext context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          DefaultTextButton(
                            text: 'Already have an account',
                            function: () {
                              navigateTo(context, const SignInScreen());
                            },
                            presstext: 'Sign In',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
