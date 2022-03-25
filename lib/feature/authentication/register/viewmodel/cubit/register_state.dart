part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSelectImage extends RegisterState {
  RegisterSelectImage();
}

class RegisterLoading extends RegisterState {
  RegisterLoading();
}

class RegisterComplete extends RegisterState {
  RegisterComplete();
}

class RegisterFailed extends RegisterState {
  RegisterFailed();
}
