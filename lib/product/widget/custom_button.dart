import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class StadiumElevatedBTN extends ElevatedButton {
  final BuildContext context;

  StadiumElevatedBTN(
      {required VoidCallback? onPressed,
      required Widget? child,
      required this.context})
      : super(
            onPressed: onPressed,
            child:
                Padding(padding: context.verticalPaddingNormal, child: child),
            style: ButtonStyle(
                shape:
                    MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    context.horizontalPaddingHigh)));
}
