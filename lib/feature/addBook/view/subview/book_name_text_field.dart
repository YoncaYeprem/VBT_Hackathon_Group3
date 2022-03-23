part of '../add_book_view.dart';

extension BookNameTextFieldExtention on AddBookView {
  CustomTextField bookNameTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextField(
        hintString: LocaleKeys.addBook_bookName.tr(),
        context: context,
        textController: reader.bookNameController,
        isObsecure: false,
        node: reader.bookNameFocus);
  }
}
