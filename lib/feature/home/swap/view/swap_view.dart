import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../bookDetail/view/book_detail_view.dart';
import '../model/cubit/swappage_cubit.dart';

import '../../../addBook/book_model/productmodel.dart';


class SwapView extends StatelessWidget {
  const SwapView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwappageCubit(),
      child: BlocConsumer<SwappageCubit, SwapPageState>(
        listener: (context, state) {
          // if (state is SwapBookFailed) {
          //   showModalBottomSheet(
          //       context: context, builder: (context) => const Text("Failed"));
          // }
        },
        builder: (context, state) {
          if (state is SwapHomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwapBookComplited) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.bookModel?.length,
                itemBuilder: (context, index) {
                  var stateIndex = state.bookModel?[index];
                  return Padding(
                    padding: context.verticalPaddingNormal,
                    child: Container(
                      width: context.dynamicWidth(0.4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _buildImage(context, stateIndex),
                    ),
                  );
                });
          }
          return const Text("");
        },
      ),
    );
  }

  Widget _buildImage(BuildContext context, BookModel? state) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookDetailView(book: state!)));
      },
      child: Column(
        children: [
          SizedBox(
            width: context.dynamicWidth(0.3),
            height: context.dynamicHeight(0.19),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                state?.photo ??
                    "https://cdn.pixabay.com/photo/2018/01/17/18/43/book-3088775__340.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(state?.bookName ?? ""),
        ],
      ),
    );
  }
}
// "https://cdn.pixabay.com/photo/2018/01/17/18/43/book-3088775__340.jpg"