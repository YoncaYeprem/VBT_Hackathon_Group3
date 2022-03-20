import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/lang/locale_keys.g.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.appBar_title.tr()),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      );
  }
}