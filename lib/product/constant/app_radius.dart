import 'package:flutter/material.dart';

class BorderRadiusCard extends BorderRadius {
  BorderRadiusCard.circular() : super.circular(12);
  const BorderRadiusCard.vertical()
      : super.vertical(top: const Radius.circular(30));
}
