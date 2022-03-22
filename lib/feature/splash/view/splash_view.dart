import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../authentication/login/view/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 350,
      duration: 3500,
      splash: 'assets/gifs/splash.gif',
      nextScreen: LoginView(),
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}
