import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import '../../myFavoritesPage/view/my_favorites_view.dart';
import '../../../../product/widget/custom_text_row.dart';
import '../../addBook/model/book_model.dart';
import '../viewmodel/cubit/book_detail_cubit.dart';

part './subView/book_image_container.dart';
part './subView/book_overview_text.dart';
part './subView/book_go_profile_button.dart';

class BookDetailView extends StatelessWidget {
  final BookModel book;
  const BookDetailView({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookDetailCubit>(
      create: (context) => BookDetailCubit(book),
      child: BlocConsumer<BookDetailCubit, BookDetailState>(
        listener: (context, state) {},
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
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () async {
                await context
                    .read<BookDetailCubit>()
                    .addOrDeleteFromFavorites();
              },
              icon: context.read<BookDetailCubit>().isSaved
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_border),
            ),
          ]),
      body: SafeArea(
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildBookImage(context, book.photo),
                    Text(
                      book.bookName ?? "",
                      textAlign: TextAlign.center,
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
                          CustomRowText(
                            icon: Icons.date_range_sharp,
                            label: 'Language:',
                            value: book.language ?? "",
                          ),
                          CustomRowText(
                            icon: Icons.date_range_sharp,
                            label: 'Publish Year:',
                            value: book.publishYear ?? "",
                          ),
                        ],
                      ),
                    ),
                    overviewText(context),
                  ],
                ),
              )),
              stickyBottomButtonsRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Row stickyBottomButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        goToBookOwnerButton(context),
        const SizedBox(
          width: 20,
        ),
        exchangeMethodButton(),
      ],
    );
  }

  Expanded exchangeMethodButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: book.exchange!
            ? const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Make Exchange ",
                    )
                  ],
                ),
              )
            : Text.rich(
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
    );
  }
}