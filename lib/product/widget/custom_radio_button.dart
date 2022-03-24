import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {Key? key,
      required this.title,
      required this.groupValue,
      required this.value,
      required this.onChanged})
      : super(key: key);

  String? title;
  dynamic groupValue;
  dynamic value;
  Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? ""),
      leading: Radio<dynamic>(
          value: value, groupValue: groupValue, onChanged: onChanged),
    );
  }
}
