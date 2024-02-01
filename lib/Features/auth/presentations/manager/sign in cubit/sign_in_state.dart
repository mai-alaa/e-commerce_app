part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final String? uId;

  SignInSuccessState(this.uId);
}

// ignore: must_be_immutable
final class SignInFailureState extends SignInState {
  late String error;
  SignInFailureState(this.error);
}
