import 'package:flutter/material.dart';

class CustomTextField extends TextFormField {
  final FocusNode node;
  final TextEditingController textController;
  final bool isObsecure;
  final String hintString;
  final TextInputType textInputType;
  final IconButton? suffix;
  //final int? maxLines;
  final BuildContext context;
  final FormFieldValidator<String>? Validator;

  CustomTextField(
      {Key? key,
      required this.hintString,
      required this.context,
      this.suffix,
      this.Validator,
      //this.maxLines,
      this.textInputType = TextInputType.text,
      required this.textController,
      required this.isObsecure,
      required this.node})
      : super(
          key: key,
          focusNode: node,
          validator: Validator,
          controller: textController,
          obscureText: isObsecure,
          //maxLines: maxLines,
          keyboardType: textInputType,
          decoration: InputDecoration(
            suffixIcon: suffix,
            label: Text(hintString),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
}

