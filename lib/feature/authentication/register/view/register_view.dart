import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/utils/validator/validator.dart';
import '../../../../product/widget/custom_text_field.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/widget/custom_button.dart';
import '../../login/view/login_view.dart';
import '../viewmodel/cubit/register_cubit.dart';

part './subView/profile_stack.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            var reader = context.read<RegisterCubit>();
            return SingleChildScrollView(
              physics: context.read<RegisterCubit>().firstNameNode.hasFocus ||
                      context.read<RegisterCubit>().lastNameNode.hasFocus ||
                      context.read<RegisterCubit>().usernameNode.hasFocus ||
                      context.read<RegisterCubit>().emailNode.hasFocus ||
                      context.read<RegisterCubit>().passwordNode.hasFocus ||
                      context.read<RegisterCubit>().repeatPasswordNode.hasFocus
                  ? ScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: context.height,
                child: SafeArea(
                  child: reader.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                          child: Padding(
                            padding: context.paddingLow,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: profileImage(
                                        context.read<RegisterCubit>())),
                                Expanded(
                                    flex: 9,
                                    child: buildForm(context,
                                        context.read<RegisterCubit>())),
                                Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginView(),
                                            ));
                                      },
                                      child: Text("Do you have an acoount?")),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Form buildForm(BuildContext context, RegisterCubit reader) {
    return Form(
      key: reader.formKey,
      autovalidateMode: !reader.firstNameNode.hasFocus ||
              !reader.lastNameNode.hasFocus ||
              !reader.usernameNode.hasFocus ||
              !reader.emailNode.hasFocus ||
              !reader.passwordNode.hasFocus ||
              !reader.repeatPasswordNode.hasFocus
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          firstNameLastNameRow(context, reader),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          usernameTextField(context, reader),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          emailTextField(context, reader),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          passwordTextField(context, reader),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          repeatPasswordTextField(context, reader),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          signUpButton(reader, context)
        ],
      ),
    );
  }

  StadiumElevatedBTN signUpButton(RegisterCubit reader, BuildContext context) {
    return StadiumElevatedBTN(
        onPressed: () {
          context.read<RegisterCubit>().userSignUp(context);
        },
        child: Text(LocaleKeys.register_signUpButton.tr()),
        context: context);
  }

  CustomTextField repeatPasswordTextField(
      BuildContext context, RegisterCubit reader) {
    return CustomTextField(
        hintString: 'Repeat Password',
        context: context,
        isObsecure: reader.isVisibleRepeatPass,
        suffix: IconButton(
            icon: reader.isVisibleRepeatPass
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              reader.changeVisibilityRepeat();
            }),
        Validator: (v) => Validator().checkRepeatPass(
            password: reader.passwordController.text, repeat: v),
        textController: reader.repeatPasswordController,
        node: reader.repeatPasswordNode);
  }

  CustomTextField passwordTextField(
      BuildContext context, RegisterCubit reader) {
    return CustomTextField(
        hintString: 'Password',
        context: context,
        suffix: IconButton(
            icon: reader.isVisiblePass
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              reader.changeVisibility();
            }),
        textController: reader.passwordController,
        Validator: (v) => Validator().validatePassword(password: v),
        isObsecure: reader.isVisiblePass,
        node: reader.passwordNode);
  }

  CustomTextField emailTextField(BuildContext context, RegisterCubit reader) {
    return CustomTextField(
        hintString: 'Email',
        context: context,
        Validator: (v) => Validator().validateEmail(email: v),
        textController: reader.emailController,
        isObsecure: false,
        node: reader.emailNode);
  }

  CustomTextField usernameTextField(
      BuildContext context, RegisterCubit reader) {
    return CustomTextField(
        hintString: 'Username',
        context: context,
        Validator: (v) => Validator().validateStrings(value: v),
        textController: reader.usernameController,
        isObsecure: false,
        node: reader.usernameNode);
  }

  Row firstNameLastNameRow(BuildContext context, RegisterCubit reader) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
              hintString: 'First Name',
              Validator: (v) => Validator().validateStrings(value: v),
              context: context,
              textController: reader.firstNameController,
              isObsecure: false,
              node: reader.firstNameNode),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: CustomTextField(
              hintString: 'Last Name',
              Validator: (v) => Validator().validateStrings(value: v),
              context: context,
              textController: reader.lastNameController,
              isObsecure: false,
              node: reader.lastNameNode),
        ),
      ],
    );
  }
}
