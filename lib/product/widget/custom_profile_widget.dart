import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../feature/authentication/register/model/user_model.dart';

class CustomProfileCard extends StatelessWidget {
  UserModel? user;
  CustomProfileCard({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.verticalPaddingHigh,
      child: Stack(alignment: Alignment.topCenter, children: [
        SizedBox(
          width: context.dynamicWidth(0.9),
          height: context.dynamicHeight(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(context.dynamicWidth(0.05))),
                child: Container(
                  width: context.dynamicWidth(0.9),
                  height: context.dynamicHeight(0.23),
                  padding: context.paddingLow,
                  child: Padding(
                    padding: context.paddingMedium,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          user?.firstname ?? "Null name",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(user?.email ?? "null mail"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundImage:
              user?.photo != null ? NetworkImage(user?.photo ?? "") : null,
          child: user?.photo == null
              ? Image.asset("assets/images/dummy_per.png")
              : null,
          radius: context.dynamicWidth(0.15),
        )
      ]),
    );
  }
}
