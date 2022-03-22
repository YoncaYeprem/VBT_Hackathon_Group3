import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/feature/other_profile_page/cubit/other_profile_page_cubit_cubit.dart';

class OtherProfilePage extends StatelessWidget {
  OtherProfilePage({Key? key, required this.user}) : super(key: key);
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
      appBar: appBarBuild(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          redAndWhiteBackground(context), //includes user books
          profileCard(context),
          ProfileText(context),
        ],
      ),
    );
  }

  Align ProfileText(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: context.horizontalPaddingMedium,
        child: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Container profileCard(BuildContext context) {
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
                          user?.displayName ?? "Null name",
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
          child: Image.asset(user?.photoURL ?? "assets/images/dummy_per.png"),
          radius: context.dynamicWidth(0.15),
        )
      ]),
    );
  }

  AppBar appBarBuild() {
    return AppBar(
      leading:
          IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left_sharp)),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket)),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
      ],
      backgroundColor: Colors.red,
      elevation: 0,
    );
  }

  Column redAndWhiteBackground(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
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
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(context
                                  .read<OtherProfilePageCubit>()
                                  .model
                                  ?.bookName ??
                              ""),
                        );
                      },
                      itemCount:
                          0, // TODO: replace with Inside of userModel => ownBooks.length
                    ))),
          ),
        )
      ],
    );
  }

  Card dummyCarBook() {
    return Card(
      elevation: 10,
      child: ListTile(
        leading:
            CircleAvatar(child: Image.asset("assets/images/dummy_per.png")),
        trailing: Text("Boook info"),
        title: Text("Book Title"),
        subtitle: Text("Book info"),
      ),
    );
  }
}
