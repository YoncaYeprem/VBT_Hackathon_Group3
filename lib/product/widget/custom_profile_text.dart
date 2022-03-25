import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomProfileText extends StatelessWidget {
  const CustomProfileText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: context.horizontalPaddingMedium,
        child: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
