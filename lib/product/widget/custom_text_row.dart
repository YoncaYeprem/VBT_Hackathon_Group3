import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomRowText extends StatelessWidget {
  final String? value;
  final String label;
  final IconData icon;
  CustomRowText({ Key? key, required this.value, required this.icon, required this.label }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: Icon(icon),
              ),
              TextSpan(
                text: label,
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Text(
          value ?? "",
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}