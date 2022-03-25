import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/cubit/mybookpage_cubit.dart';

import '../../bookDetail/view/book_detail_view.dart';

class MyBookPage extends StatelessWidget {
  const MyBookPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider<MybookpageCubit>(
        create: (context) => MybookpageCubit(),
        child: BlocConsumer<MybookpageCubit, MybookpageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MyBookLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MyBookPageCompleted) {
              return _buildListTile(context, state);
            } else {
              return const Text("");
            }
          },
        ),
      ),
    );
  }

  Padding _buildListTile(BuildContext context, MyBookPageCompleted state) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingLow,
            child: Text(
              LocaleKeys.profil_book_myBook.tr(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: state.bookModel?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.navigateToPage(
                          BookDetailView(book: state.bookModel![index]));
                    },
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: state.bookModel?[index].photo != null
                              ? NetworkImage(
                                  state.bookModel?[index].photo ?? "")
                              : null,
                          child: state.bookModel?[index].photo == null
                              ? Image.asset("assets/images/dummy_per.png")
                              : null,
                        ),
                        trailing: Text("${state.bookModel?[index].pageCount}"),
                        title: Text(state.bookModel?[index].bookName ??
                            "null book name"),
                        subtitle: SingleChildScrollView(
                          child: SizedBox(
                            child: Text(
                              state.bookModel?[index].overview ??
                                  "null overview",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios,
                color: context.appTheme.canvasColor)));
  }
}
