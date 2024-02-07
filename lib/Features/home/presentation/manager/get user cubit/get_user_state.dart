part of 'get_user_cubit.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}

final class GetUserLoadingState extends GetUserState {}

final class GetUserSuccessState extends GetUserState {}

final class GetUserErrorState extends GetUserState {
  final String error;
  GetUserErrorState(this.error);
}
