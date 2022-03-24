import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/product/constant/app_radius.dart';

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
              decoration: BoxDecoration(color: Theme.of(context).canvasColor),
            )),
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, borderRadius: BorderRadiusCard.vertical()),
            child: Padding(
              padding: EdgeInsets.only(top: context.dynamicHeight(0.15)),
              child: body,
            ),
          ),
        )
      ],
    );
  }
}
