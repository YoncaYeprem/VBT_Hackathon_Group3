import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbt_hackathon_group3/core/init/lang/locale_keys.g.dart';
import 'package:vbt_hackathon_group3/core/init/theme/color/i_color_theme.dart';
import 'package:vbt_hackathon_group3/feature/authentication/login/viewmodel/cubit/login_cubit.dart';
import 'package:vbt_hackathon_group3/feature/authentication/register/view/register_view.dart';
import 'package:vbt_hackathon_group3/feature/profile/view/profile_view.dart';
import 'package:vbt_hackathon_group3/product/utils/validator.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_button.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_text_field.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  var mailNode = FocusNode();
  var passNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SignSucces) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Login succes")));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfileView()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.dynamicHeight(0.05),
                    ),
                    Image.asset("assets/images/login.png"),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(context.mediumValue)),
                      elevation: 20,
                      margin: context.paddingMedium,
                      child: SizedBox(
                        height: context.dynamicHeight(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                mailTextField(context),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                passwordTextField(context),
                                forgetPassBTN(context),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                signInBTN(context),
                                signUpBTN(context)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextButton signUpBTN(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterView()));
      },
      child: Text(
        LocaleKeys.register_signUpButton.tr(),
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: AppColors().lightRed),
      ),
    );
  }

  StadiumElevatedBTN signInBTN(BuildContext context) {
    return StadiumElevatedBTN(
        onPressed: () {
          context
              .read<LoginCubit>()
              .signIn(_mailController.text, _passController.text, context);
        },
        child: Text(LocaleKeys.login_signInButton.tr()),
        context: context);
  }

  Row forgetPassBTN(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(LocaleKeys.login_forgetPassowrd.tr(),
                style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }

  CustomTextField passwordTextField(BuildContext context) {
    return CustomTextField(
        Validator: (v) => Validator().validatePasswordForm(v),
        context: context,
        suffix: IconButton(
            icon: context.read<LoginCubit>().isVisible
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              context.read<LoginCubit>().changeVisibility();
            }),
        hintString: LocaleKeys.login_passwordText.tr(),
        textController: _passController,
        isObsecure: context.read<LoginCubit>().isVisible,
        node: passNode);
  }

  CustomTextField mailTextField(BuildContext context) {
    return CustomTextField(
        context: context,
        Validator: (v) => Validator().validateMailForm(v),
        textInputType: TextInputType.emailAddress,
        hintString: LocaleKeys.login_emailText.tr(),
        textController: _mailController,
        isObsecure: false,
        node: mailNode);
  }
}
