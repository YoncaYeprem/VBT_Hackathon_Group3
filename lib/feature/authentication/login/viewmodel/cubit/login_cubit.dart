import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vbt_hackathon_group3/product/utils/cache/cache_manager.dart';
import '../../../../../core/init/locale/locale_manager.dart';
import '../../../../../product/utils/cache/user_manager.dart';
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
      await CacheManager.saveStringData(PreferencesKey.token, user.uid);
      await CacheManager.saveBoolData(PreferencesKey.login, true);
      context.read<UserManager>().saveToken(user.uid);
      print(user.uid);
      emit(SignSucces());
    } else {
      emit(SignFailure());
    }
  }
}
