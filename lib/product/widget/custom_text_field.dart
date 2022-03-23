import 'package:flutter/material.dart';

class CustomTextField extends TextFormField {
  final FocusNode node;
  final TextEditingController textController;
  final bool isObsecure;
  final int? maxLines;
  final String hintString;
  final TextInputType textInputType;
  final IconButton? suffix;
  final BuildContext context;

  CustomTextField(
      {Key? key,
      required this.hintString,
      required this.context,
      this.suffix,
      this.textInputType = TextInputType.text,
      this.maxLines,
      required this.textController,
      required this.isObsecure,
      required this.node})
      : super(
          key: key,
          focusNode: node,
          controller: textController,
          obscureText: isObsecure,
          keyboardType: textInputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            suffixIcon: suffix,
            label: Text(hintString),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
}
