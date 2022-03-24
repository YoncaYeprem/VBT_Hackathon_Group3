import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _radius = 10;
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: BorderRadius.circular(_radius)),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'arama',
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            suffixIconConstraints: const BoxConstraints(maxHeight: 30),
            suffixIcon: const Icon(Icons.mic),
          ),
        ),
      ),
    );
  }
}
