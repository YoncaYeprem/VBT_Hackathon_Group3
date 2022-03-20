import 'package:flutter/material.dart';

class CustomTextField extends TextFormField {
  final FocusNode node;
  final TextEditingController textController;
  final bool isObsecure;

  CustomTextField(
      {Key? key,
      required this.textController,
      required this.isObsecure,
      required this.node})
      : super(
          key: key,
          focusNode: node,
          controller: textController,
          obscureText: isObsecure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
}
