import 'package:flutter/material.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_profile_background.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_profile_text.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_profile_widget.dart';

import '../../../product/widget/custom_profile_detail_list.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ProfileBackground(body: const ProfileInformation()),
          CustomProfileCard(),
          const CustomProfileText(),
        ],
      ),
    );
  }
}

AppBar appBarBuild() {
  return AppBar(
    leading: IconButton(
        onPressed: () {}, icon: const Icon(Icons.chevron_left_sharp)),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
    ],
    backgroundColor: Colors.red,
    elevation: 0,
  );
}
