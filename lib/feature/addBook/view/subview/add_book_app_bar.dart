part of '../add_book_view.dart';

extension AddBookAppBar on AddBookView {
  AppBar addBookAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.addBook_addBookAppBar.tr(),
        style: context.textTheme.bodyText2!
            .copyWith(color: context.appTheme.canvasColor),
      ),
      leading: IconButton(
        icon: Icon(Icons.clear_sharp,
            size: 30, color: context.appTheme.canvasColor),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
