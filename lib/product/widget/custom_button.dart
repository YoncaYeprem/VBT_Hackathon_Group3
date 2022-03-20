import 'package:flutter/material.dart';

class StadiumElevatedBTN extends ElevatedButton {
  StadiumElevatedBTN({required VoidCallback? onPressed, required Widget? child})
      : super(
            onPressed: onPressed,
            child: child,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
            ));
}
