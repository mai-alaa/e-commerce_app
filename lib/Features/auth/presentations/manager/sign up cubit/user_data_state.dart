// ignore_for_file: must_be_immutable

part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class CreateUserLoadingState extends UserDataState {}

final class CreateUserFailureState extends UserDataState {
  late String error;

  CreateUserFailureState(this.error);
}

final class CreateUserSucessState extends UserDataState {
  final String? uId;
  CreateUserSucessState(this.uId);
}

final class ChangePassVisibilityState extends UserDataState {}
