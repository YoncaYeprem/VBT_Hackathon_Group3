import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/widget/custom_text_row.dart';
import '../../addBook/model/product_model.dart';
import '../viewmodel/cubit/book_detail_cubit.dart';

part './subView/book_image_container.dart';

class BookDetailView extends StatelessWidget {
  final BookModel book;
  BookDetailView({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookDetailCubit>(
      create: (context) => BookDetailCubit(),
      child: BlocConsumer<BookDetailCubit, BookDetailState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return buildScaffold(context);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () {
                context.read<BookDetailCubit>().changeSave();
              },
              icon: context.read<BookDetailCubit>().isSaved
                  ? Icon(Icons.bookmark)
                  : Icon(Icons.bookmark_border),
            ),
          ]),
      body: SafeArea(
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildBookImage(context, book.photo ?? ""),
                    Text(
                      book.bookName ?? "",
                      style: context.textTheme.headline5,
                    ),
                    Text(
                      book.author ?? "",
                      style: context.textTheme.subtitle1,
                    ),
                    Text("${book.pageCount} Pages",
                        style: context.textTheme.headline6),
                    Padding(
                      padding: context.horizontalPaddingNormal,
                      child: Column(
                        children: [
                          CustomRowText(
                            icon: Icons.category_rounded,
                            label: 'Category',
                            value: book.category?.toUpperCase(),
                          ),
                          CustomRowText(
                            icon: Icons.date_range_sharp,
                            label: 'Uploaded At:',
                            value: DateFormat("dd-MM-yyyy - kk:mm")
                                .format(book.createdAt),
                          ),
                        ],
                      ),
                    ),
                    overviewText(context),
                  ],
                ),
              )),
              stickyBottomButtonsRow(),
            ],
          ),
        ),
      ),
    );
  }

  Container overviewText(BuildContext context) {
    return Container(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Overview ",
              style: context.textTheme.headlineSmall,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            Text(
              book.overview ?? "",
              style: context.textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }

  Row stickyBottomButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child:
                ElevatedButton(onPressed: () {}, child: Text("Go To Profile"))),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Text.rich(
              TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(Icons.shopping_cart),
                  ),
                  TextSpan(
                    text: "${book.price ?? ""} ",
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
