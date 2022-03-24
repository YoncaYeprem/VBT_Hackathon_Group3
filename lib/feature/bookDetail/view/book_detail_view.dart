import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../other_profile_page/view/other_profile_page_view.dart';
import '../../addBook/book_model/productmodel.dart';
import '../../myFavoritesPage/view/my_favorites_view.dart';
import '../../../../product/widget/custom_text_row.dart';
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
              onPressed: () {
                context.pop();
              }, icon: const Icon(Icons.arrow_back_ios)),
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
                            label: LocaleKeys.bookDetail_category.tr(),
                            value: book.category?.toUpperCase(),
                          ),
                          CustomRowText(
                            icon: Icons.date_range_sharp,
                            label: LocaleKeys.bookDetail_uploadedAt.tr(),
                            value: book.createdAt,
                          ),
                          CustomRowText(
                            icon: Icons.date_range_sharp,
                            label: LocaleKeys.bookDetail_language.tr(),
                            value: book.language ?? "",
                          ),
                          CustomRowText(
                            icon: Icons.date_range_sharp,
                            label: LocaleKeys.bookDetail_publishYear.tr(),
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
        goToBookOwnerButton( book.userId ?? "" ,context),
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
            ? Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.bookDetail_exhange.tr(),
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
