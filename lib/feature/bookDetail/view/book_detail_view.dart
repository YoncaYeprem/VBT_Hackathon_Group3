import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/cubit/book_detail_cubit.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookDetailCubit>(
      create: (context) => BookDetailCubit(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            Text("Hellü"),
          ]),
        ),),
      ),
    );
  }
}
