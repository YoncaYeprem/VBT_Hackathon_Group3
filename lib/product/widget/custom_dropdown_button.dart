import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.selectedValue,
      required this.tittleText})
      : super(key: key);

  List? items;
  Function(dynamic)? onChanged;
  var selectedValue;
  String? tittleText;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        icon: const Padding(
          padding: EdgeInsets.only(left: 180),
          child: Icon(Icons.arrow_downward),
        ),
        iconSize: 28,
        hint: Text(tittleText ?? ""),
        onChanged: onChanged,
        value: selectedValue,
        items: items?.map((e) {
          return DropdownMenuItem(value: e, child: Text(e.toString()));
        }).toList());
  }
}
