import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../authentication/register/view/register_view.dart';
import '../../home/home_view/home_view.dart';

import '../../authentication/login/view/login_view.dart';
import '../viewmodel/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return AnimatedSplashScreen(
            splashIconSize: 350,
            duration: 3500,
            splash: 'assets/gif/splash.gif',
            nextScreen: context.read<SplashCubit>().goHomeBool
                ? HomeView()
                : context.read<SplashCubit>().goLoginBool
                    ? LoginView()
                    : RegisterView(),
            splashTransition: SplashTransition.sizeTransition,
          );
        },
      ),
    );
  }
}
