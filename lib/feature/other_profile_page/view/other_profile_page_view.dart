import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../product/widget/custom_profile_background.dart';
import '../../../product/widget/custom_profile_book_list.dart';
import '../../../product/widget/custom_profile_text.dart';
import '../../../product/widget/custom_profile_widget.dart';
import '../cubit/other_profile_page_cubit.dart';

class OtherProfilePage extends StatelessWidget {
  const OtherProfilePage({Key? key, required this.userId}) : super(key: key);
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtherProfilePageCubit(userId ?? ""),
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
    );
  }

  AppBar appBarBuild(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.chevron_left_sharp)),
      backgroundColor: Colors.red,
      elevation: 0,
    );
  }
}
