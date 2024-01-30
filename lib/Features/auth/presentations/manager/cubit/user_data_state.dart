part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class CreateUserLoadingState extends UserDataInitial {}

final class CreateUserFailureState extends UserDataInitial {}

final class CreateUserSucessState extends UserDataInitial {}
