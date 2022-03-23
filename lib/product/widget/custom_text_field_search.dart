import 'package:flutter/material.dart';

class CustomTextFieldSearch extends TextFormField {
  final FocusNode? node;
  final TextEditingController? textController;
  final bool? isObsecure;
  final String? hintString;
  final TextInputType? textInputType;
  final IconButton? suffix;
  final BuildContext? context;

  CustomTextFieldSearch(
      {Key? key,
       this.hintString,
       this.context,
      this.suffix,
      this.textInputType = TextInputType.text,
       this.textController,
       this.isObsecure,
       this.node})
      : super(
          key: key,
          focusNode: node,
          controller: textController,
          obscureText: isObsecure ?? false,
          keyboardType: textInputType,
          decoration: InputDecoration(
            suffixIcon: suffix,
            label: Text(hintString ?? ""),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
}
