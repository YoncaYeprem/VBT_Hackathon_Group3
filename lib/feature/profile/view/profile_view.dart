import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/locale/locale_manager.dart';
import '../../../product/utils/cache/cache_manager.dart';
import '../../../product/utils/cache/user_manager.dart';
import '../../home/home_view/home_view.dart';
import '../viewmodel/cubit/profile_cubit.dart';

import '../../../product/widget/custom_profile_background.dart';
import '../../../product/widget/custom_profile_text.dart';
import '../../../product/widget/custom_profile_widget.dart';

import '../../../product/widget/custom_profile_detail_list.dart';

class ProfileView extends StatelessWidget {
  final String? userId;

  const ProfileView({
    Key? key,
    this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(userId),
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
    appBar: appBarBuild(context),
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

AppBar appBarBuild(BuildContext context) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          context.navigateToPage(HomeView());
        },
        icon: const Icon(Icons.chevron_left_sharp)),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
    ],
    backgroundColor: Colors.red,
    elevation: 0,
  );
}
