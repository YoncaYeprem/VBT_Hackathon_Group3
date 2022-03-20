part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class SignSucces extends LoginState {}

class SignFailure extends LoginState {}
