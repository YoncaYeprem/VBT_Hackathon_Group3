import 'package:flutter/material.dart';

class customTextField extends TextFormField {
  final TextEditingController textController;
  final bool isObsecure;

  customTextField(
      {Key? key, required this.textController, required this.isObsecure})
      : super(
          key: key,
          obscureText: isObsecure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
}
