import 'package:flutter/material.dart';
import 'package:vbt_hackathon_group3/core/init/lang/locale_keys.g.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_button.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(textController: _controller, isObsecure: false),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            customTextField(textController: _controller, isObsecure: false),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            stadiumElevatedBTN(
                onPressed: () {}, child: Text(LocaleKeys.login_signInButton)),
          ],
        )),
      ),
    );
  }
}
