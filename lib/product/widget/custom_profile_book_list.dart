import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/feature/bookDetail/view/book_detail_view.dart';

import '../../feature/addBook/book_model/productmodel.dart';

class ProfileBookList extends StatefulWidget {
  ProfileBookList({Key? key, required this.bookList}) : super(key: key);

  final List<BookModel> bookList;

  @override
  State<ProfileBookList> createState() => _ProfileBookListState();
}

class _ProfileBookListState extends State<ProfileBookList> {
  final isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (widget.bookList.length == 0) {
            return const Center(
              child: Text("Henüz buralar boş"),
            );
          } else {
            return listCard(
              widget.bookList[index],
              context,
            );
          }
        },
        itemCount: widget.bookList.length,
      ),
    );
  }
}

Widget listCard(BookModel model, BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.navigateToPage(BookDetailView(book: model));
    },
    child: Card(
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage:
              model.photo != null ? NetworkImage(model.photo ?? "") : null,
          child: model.photo == null
              ? Image.asset("assets/images/dummy_per.png")
              : null,
        ),
        trailing: Text("Sayfa sayısı: ${model.pageCount}"),
        title: Text(model.bookName ?? "null book name"),
        subtitle: SingleChildScrollView(
          child: SizedBox(
            child: Text(
              model.overview ?? "null overview",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    ),
  );
}
