import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isVisible = true;
  void changeVisibility() {
    isVisible = !isVisible;
    emit(LoginInitial());
  }
}
