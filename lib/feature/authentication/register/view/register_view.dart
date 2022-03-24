import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/lang/locale_keys.g.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

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
                height: context.dynamicHeight(1.5),
                child: SafeArea(
                  child: reader.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                          child: Padding(
                            padding: context.paddingLow,
                            child: Column(
                              children: [
                                Expanded(
                                    child: profileImage(
                                        context.read<RegisterCubit>())),
                                Expanded(
                                    flex: 6,
                                    child: buildForm(context,
                                        context.read<RegisterCubit>())),
                                Expanded(
                                  flex: 2,
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
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            );
          },
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      );
  }
}