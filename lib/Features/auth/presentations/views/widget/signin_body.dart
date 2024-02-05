import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Core/utils/assets.dart';
import 'package:ecommerce_app/Core/utils/functions/navigation.dart';
import 'package:ecommerce_app/Core/utils/functions/toasts_message.dart';
import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/auth/presentations/manager/sign%20in%20cubit/sign_in_cubit.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/sign_up_screen.dart';
import 'package:ecommerce_app/Features/auth/presentations/views/widget/background_auth.dart';
import 'package:ecommerce_app/Core/widgets/custom_textFormFeiled.dart';
import 'package:ecommerce_app/Core/widgets/default_button.dart';
import 'package:ecommerce_app/Core/widgets/default_textButton.dart';
import 'package:ecommerce_app/Features/home/presentation/views/home_screen_view.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  var emailAddressController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            navigateTo(
                context, const HomeScreen(), const Duration(microseconds: 1));
          }
          if (state is SignInFailureState) {
            showToast(text: state.error, state: ToastStates.error);
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
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return emailValidationText.data;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormFeiled(
                            controller: passwordController,
                            type: TextInputType.emailAddress,
                            label: 'Password',
                            isPassword: SignInCubit.get(context).isPass,
                            prefix: Icons.password,
                            suffix: SignInCubit.get(context).suffix,
                            suffixPressed: () {
                              SignInCubit.get(context)
                                  .changePasswordVisibilty();
                            },
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return passValidationText.data;
                              }
                              return null;
                            },
                          ),
                          space50,
                          ConditionalBuilder(
                            builder: (context) {
                              return DefaultButton(
                                text: 'Sign In',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    SignInCubit.get(context).signUser(
                                        email: emailAddressController.text,
                                        password: passwordController.text);
                                  }
                                },
                                image: null,
                              );
                            },
                            condition: state is! SignInLoadingState,
                            fallback: (BuildContext context) => const Center(
                                child: CircularProgressIndicator()),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
