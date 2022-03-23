import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../product/utils/firebase/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isVisible = true;
  void changeVisibility() {
    isVisible = !isVisible;
    emit(LoginInitial());
  }

  Future<void> signIn(
      String mail, String password, BuildContext context) async {
    emit(LoadingState());
    User? user = await Authentication()
        .eMailSignIn(eMail: mail, password: password, context: context);

    if (user != null) {
      emit(SignSucces());
    } else {
      emit(SignFailure());
    }
  }
}
