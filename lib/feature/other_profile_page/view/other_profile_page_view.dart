import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_profile_book_list.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_profile_widget.dart';

import '../../../product/widget/custom_profile_background.dart';
import '../../../product/widget/custom_profile_text.dart';
import '../../profile/view/profile_view.dart';
import '../cubit/other_profile_page_cubit.dart';

class OtherProfilePage extends StatelessWidget {
  const OtherProfilePage({Key? key, required this.user}) : super(key: key);
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtherProfilePageCubit(),
      child: BlocConsumer<OtherProfilePageCubit, OtherProfilePageCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildScaffold(context);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: appBarBuild(context),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ProfileBackground(body: const ProfileBookList()),
          CustomProfileCard(),
          const CustomProfileText(),
        ],
      ),
    );
  }

  AppBar appBarBuild(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {}, icon: const Icon(Icons.chevron_left_sharp)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfileView()));
            },
            icon: const Icon(Icons.notifications))
      ],
      backgroundColor: Colors.red,
      elevation: 0,
    );
  }
}
