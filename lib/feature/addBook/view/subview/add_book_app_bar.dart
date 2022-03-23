part of '../add_book_view.dart';

extension AddBookAppBar on AddBookView {
  AppBar addBookAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.addBook_addBookAppBar.tr(),
        style: TextStyle(fontSize: 20),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.clear_sharp,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
