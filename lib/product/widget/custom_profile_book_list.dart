import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';
import '../productmodel.dart';

class ProfileBookList extends StatelessWidget {
  ProfileBookList({Key? key, required this.bookList}) : super(key: key);

  final List<BookModel> bookList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (bookList.length == 0) {
          return const Center(
            child: Text("Henüz buralar boş"),
          );
        } else {
          return listCard(bookList[index], context);
        }
      },
      itemCount: bookList.length,
    );
  }
}

Widget listCard(BookModel model, BuildContext context) {
  return Card(
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
          height: context.dynamicHeight(0.1),
          child: Text(
            model.overview ?? "null overview",
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    ),
  );
}
