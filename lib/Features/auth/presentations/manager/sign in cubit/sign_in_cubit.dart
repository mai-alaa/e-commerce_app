import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);
  bool isPass = true;
  IconData suffix = Icons.visibility_off_outlined;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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

  Future<void> signInAnomnous() async {
    emit(SignInAnomnousLoadingState());
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      // emit(SignInAnomnousSucessState());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      emit(SignInAnomnousFailureState(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoadingState()); // Emit loading state

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      emit(SignInSuccessState(userCredential.user?.uid)); // Emit success state
    } catch (e) {
      print(e.toString());
      // Handle error
      emit(SignInFailureState(
          e.toString())); // Emit failure state with error message
    }
  }

  void changePasswordVisibilty() {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SignInChangePasswordVisibilityState());
  }
}
