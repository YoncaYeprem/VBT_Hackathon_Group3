import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../direaction_page.dart';
import '../../home/home_view/home_view.dart';

import '../../addBook/book_model/productmodel.dart';
import '../../bookDetail/view/book_detail_view.dart';
import '../viewmodel/cubit/my_favorites_cubit.dart';

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyFavoritesCubit>(
      create: (context) => MyFavoritesCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Favorite Books",
            style: context.textTheme.headline5!
                .copyWith(color: context.appTheme.canvasColor),
          ),
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios,
                  color: context.appTheme.canvasColor)),
          actions: [
            IconButton(
                onPressed: () {
                  context.navigateToPage(DirectionPage());
                },
                icon: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.add,
                      size: 40, color: context.appTheme.canvasColor),
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocConsumer<MyFavoritesCubit, MyFavoritesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return checkState(context, state);
          },
        ),
      ),
    );
  }

  Widget checkState(BuildContext context, state) {
    if (state is MyFavoritesInitial) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MyfavoritesCompleted) {
      return buildPage(context, state);
    } else if (state is MyFavoritesRemoveItem) {
      return buildPage(context, state);
    } else {
      return const Center(
        child: SizedBox(),
      );
    }
  }

  SafeArea buildPage(BuildContext context, state) {
    return SafeArea(
        child: Padding(
      padding: context.paddingLow,
      child: GridView.builder(
          itemCount: state.allFavorites?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.65, crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            BookModel? currentBook = state.allFavorites?[index];
            var image = currentBook?.photo == ""
                ? "https://www.yunanadalariferibotlari.com/images/my_pictures/temp/notfound.png"
                : currentBook?.photo;
            return GestureDetector(
              onTap: () =>
                  context.navigateToPage(BookDetailView(book: currentBook!)),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: context.normalBorderRadius,
                ),
                child: Padding(
                  padding: context.paddingLow,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            imageCard(context, image),
                            Positioned(
                                top: -13,
                                right: -5,
                                child: IconButton(
                                    onPressed: () async {
                                      await context
                                          .read<MyFavoritesCubit>()
                                          .removeFromFavorites(currentBook);
                                    },
                                    icon: const Icon(
                                      Icons.favorite,
                                      size: 25,
                                      color: Colors.red,
                                    ))),
                          ],
                        ),
                      ),
                      bookNameText(currentBook, context),
                      authorText(currentBook),
                      exchangeMethodText(currentBook, context),
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }

  Text bookNameText(BookModel? currentBook, BuildContext context) {
    return Text(
      currentBook?.bookName ?? "",
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.labelLarge!.copyWith(color: Colors.black),
    );
  }

  Text authorText(BookModel? currentBook) => Text(currentBook?.author ?? "");

  Text exchangeMethodText(BookModel? currentBook, BuildContext context) {
    return Text(
      currentBook?.exchange == true ? "Exchange" : "${currentBook?.price}",
      style: context.textTheme.bodyLarge!.copyWith(color: Colors.green),
    );
  }

  Center imageCard(BuildContext context, String? image) {
    return Center(
      child: ClipRRect(
        borderRadius: context.normalBorderRadius,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Image(
            image: NetworkImage(image ?? ""),
            fit: BoxFit.fill, // use this
          ),
        ),
      ),
    );
  }
}
