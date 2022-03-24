import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodel/cubit/profile_cubit.dart';

import '../../../product/widget/custom_profile_background.dart';
import '../../../product/widget/custom_profile_text.dart';
import '../../../product/widget/custom_profile_widget.dart';

import '../../../product/widget/custom_profile_detail_list.dart';

class ProfileView extends StatelessWidget {
  final User? user;

  const ProfileView({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child:
          BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
        if (state is FailedState) {
          showModalBottomSheet(
              context: context, builder: (context) => const Text("Failed"));
        }
      }, builder: (context, state) {
        if (state is GettingDataLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is UserDownloadedState) {
          return buildScaffold(context);
        }
        return const Text("Hata");
      }),
    );
  }
}

Scaffold buildScaffold(BuildContext context) {
  return Scaffold(
    appBar: appBarBuild(),
    body: Stack(
      alignment: Alignment.topCenter,
      children: [
        ProfileBackground(body: const ProfileInformation()),
        CustomProfileCard(
          user: context.read<ProfileCubit>().userModel,
        ),
        const CustomProfileText(),
      ],
    ),
  );
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
