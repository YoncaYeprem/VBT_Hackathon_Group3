import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProfileBackground extends StatelessWidget {
  Widget body;
  ProfileBackground({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(color: Colors.red),
            )),
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            // child: dummyList(context),
            child: Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: context.dynamicHeight(0.15)),
              child: body,
            )),
          ),
        )
      ],
    );
  }
}
