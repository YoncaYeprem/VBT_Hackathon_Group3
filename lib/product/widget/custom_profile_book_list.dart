import 'package:flutter/material.dart';
import 'package:vbt_hackathon_group3/product/productmodel.dart';

class ProfileBookList extends StatelessWidget {
  ProfileBookList({Key? key, required this.bookList}) : super(key: key);

  final List<BookModel> bookList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (bookList.length == 0) {
          return Center(
            child: Text("Henüz buralar boş"),
          );
        }
        return listCard(bookList[index]);
      },
      itemCount: bookList.length,
    );
  }
}

Widget listCard(BookModel model) {
  return Card(
    elevation: 10,
    child: ListTile(
      leading: CircleAvatar(child: Image.asset("assets/images/dummy_per.png")),
      trailing: Text("Sayfa sayısı: ${model.pageCount}"),
      title: Text(model.bookName ?? "null book name"),
      subtitle: SingleChildScrollView(
        child: Text(model.overview ?? "null overview",
            overflow: TextOverflow.fade, maxLines: 5),
      ),
    ),
  );
}
