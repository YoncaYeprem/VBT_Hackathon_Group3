import 'package:flutter/material.dart';

class stadiumElevatedBTN extends ElevatedButton {
  stadiumElevatedBTN({required VoidCallback? onPressed, required Widget? child})
      : super(
            onPressed: onPressed,
            child: child,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
            ));
}
