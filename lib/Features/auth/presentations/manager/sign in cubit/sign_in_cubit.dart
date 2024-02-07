import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);
  bool isPass = true;
  IconData suffix = Icons.visibility_outlined;

  Future<void> signUser(
      {required String email, required String password}) async {
    emit(SignInLoadingState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccessState(user.user?.uid));
    } on FirebaseAuthException catch (e) {
      String error = '';

      if (e.code == 'wrong-password') {
        error = 'Incorrect password. Please try again.';
      } else if (e.code == 'network-request-failed') {
        error = 'No Internet Connection';
      } else if (e.code == 'user-not-found') {
        error =
            'User not found. Please check your email or sign up for a new account.';
      } else if (e.code == 'too-many-requests') {
        error = 'Too many attempts please try later';
      } else if (e.code == 'unknown') {
        error = 'Email and Password Fields are required';
      } else if (e.code == 'invalid-email') {
        error = 'Invalid email address. Please enter a valid email.';
      } else {
        error = e.code.toString();
      }
      emit(SignInFailureState(error));
    }
  }

  void changePasswordVisibilty() {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SignInChangePasswordVisibilityState());
  }
}
