import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon_group3/core/init/lang/locale_keys.g.dart';
import 'package:vbt_hackathon_group3/core/init/theme/color/i_color_theme.dart';
import 'package:vbt_hackathon_group3/feature/authentication/register/view/register_view.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_button.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_text_field.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  var mailNode = FocusNode();
  var passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/login.png"),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.mediumValue)),
                elevation: 20,
                margin: context.paddingMedium,
                child: SizedBox(
                  height: context.dynamicHeight(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                            textController: _mailController,
                            isObsecure: false,
                            node: mailNode),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        CustomTextField(
                            textController: _passController,
                            isObsecure: true,
                            node: passNode),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        StadiumElevatedBTN(
                            onPressed: () {},
                            child: Text(LocaleKeys.login_signInButton.tr()),
                            context: context),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterView()));
                          },
                          child: Text(
                            LocaleKeys.register_signUpButton.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: AppColors().lightRed),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//  return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: context.horizontalPaddingNormal,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(LocaleKeys.login_signInButton.tr()),
//                   Container(
//                     height: context.dynamicHeight(0.5),
//                     child: Card(
//                       color: Colors.amber,
//                       elevation: 10,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Padding(
//                         padding: context.horizontalPaddingNormal,
//                         child: Form(
//                             child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomTextField(
//                                 textController: _controller,
//                                 isObsecure: false,
//                                 node: mailNode),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             CustomTextField(
//                                 textController: _controller,
//                                 isObsecure: false,
//                                 node: passNode),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             StadiumElevatedBTN(
//                                 context: context,
//                                 onPressed: () {},
//                                 child: Text(
//                                   LocaleKeys.login_signInButton.tr(),
//                                   style: Theme.of(context).textTheme.button,
//                                 )),
//                           ],
//                         )),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );