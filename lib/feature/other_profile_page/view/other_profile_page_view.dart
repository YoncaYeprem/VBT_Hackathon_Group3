import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/widget/custom_profile_background.dart';
import '../../../product/widget/custom_profile_book_list.dart';
import '../../../product/widget/custom_profile_text.dart';
import '../../../product/widget/custom_profile_widget.dart';
import '../../profile/view/profile_view.dart';
import '../cubit/other_profile_page_cubit.dart';

class OtherProfilePage extends StatelessWidget {
  const OtherProfilePage({Key? key, required this.user}) : super(key: key);
  final User? user;
  final tempUID = "UI6gjx43h6gYEigYKNphCOWn8tH2";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtherProfilePageCubit(),
      child: BlocConsumer<OtherProfilePageCubit, OtherProfilePageCubitState>(
        listener: (context, state) {
          if (state is FailedState) {
            state.showMessage(context);
          }
        },
        builder: (context, state) {
          if (state is FailedState) {
            return Scaffold(
              body: Center(
                child: Text(
                  "Failed",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            );
          } else if (state is GettingDataLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
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
          ProfileBackground(
              body: ProfileBookList(
            bookList: context.read<OtherProfilePageCubit>().listBookModel ?? [],
          )),
          CustomProfileCard(
            user: context.read<OtherProfilePageCubit>().user,
          ),
          const CustomProfileText(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<OtherProfilePageCubit>()
              .getAllBookData(context.read<OtherProfilePageCubit>().user?.id);
        },
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
