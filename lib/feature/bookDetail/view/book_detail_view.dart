import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../viewmodel/cubit/book_detail_cubit.dart';

class BookDetailView extends StatelessWidget {
  BookDetailView({Key? key}) : super(key: key);
  String _imageUrl =
      "https://i.pinimg.com/474x/a7/91/62/a7916230aedcdce47a4dfbff5247f0ce.jpg";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookDetailCubit>(
      create: (context) => BookDetailCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Icon(Icons.arrow_back_ios),
            actions: [Icon(Icons.bookmark)]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: context.paddingLow,
              child: SizedBox(
                width: context.width,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: context.dynamicHeight(0.4),
                      width: context.dynamicWidth(0.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AspectRatio(
                          aspectRatio: 1 / 2.5,
                          child: Image(
                            image: NetworkImage(_imageUrl),
                            fit: BoxFit.fill, // use this
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   height: context.dynamicHeight(0.38),
                    //   width: context.dynamicWidth(0.5),
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       fit: BoxFit.fitHeight,
                    //       image: NetworkImage(
                    //         _imageUrl,
                    //       ),
                    //     ),
                    //     borderRadius: BorderRadius.circular(15.0),
                    //   ),
                    // ),
                    Text(
                      "The Hunger Games",
                      style: context.textTheme.headline5,
                    ),
                    Text(
                      "Suzanne Collins",
                      style: context.textTheme.subtitle1,
                    ),
                    Text("456 Pages", style: context.textTheme.headline6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overview ",
                          style: context.textTheme.headlineSmall,
                          textAlign: TextAlign.start,
                        ),
                        Container(
                          child: Text(
                            "Overview About The Book fsfsfasdf" * 12,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 700,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
