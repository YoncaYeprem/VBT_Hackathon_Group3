part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}
class SplashCompleted extends SplashState {}
class SplashGoHome extends SplashState {}
class SplashGoLogin extends SplashState {}
class SplashGoOnboard extends SplashState {}
