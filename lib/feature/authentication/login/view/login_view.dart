import 'package:flutter/material.dart';
import 'package:vbt_hackathon_group3/core/init/lang/locale_keys.g.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_button.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  var _controller = TextEditingController();
  var mailNode = FocusNode();
  var passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                textController: _controller, isObsecure: false, node: mailNode),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextField(
                textController: _controller, isObsecure: false, node: passNode),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            StadiumElevatedBTN(
                onPressed: () {}, child: Text(LocaleKeys.login_signInButton)),
          ],
        )),
      ),
    );
  }
}
