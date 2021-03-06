import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/init/locale/locale_manager.dart';
import '../../../../product/utils/cache/cache_manager.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    init();
  }

  BuildContext context;
  bool isLoading = false;
  bool goLoginBool = false;
  bool goHomeBool = false;
  bool goRegisterBool = false;

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> init() async {
    changeLoading();
    await CacheManager.getStringData(PreferencesKey.token) != ""
        ? goHome()
        : await CacheManager.getBoolData(PreferencesKey.login) == true
            ? gologin()
            : goRegister();
    changeLoading();
    emit(SplashCompleted());
  }

  void goHome() {
    print(CacheManager.getStringData(PreferencesKey.token));
    goHomeBool = true;
    
    emit(SplashGoHome());
  }

  void gologin() {
    goLoginBool = true;
    
    emit(SplashGoLogin());
  }
  void goRegister() {
    goRegisterBool = true;
    
    emit(SplashGoOnboard());
  }
}
