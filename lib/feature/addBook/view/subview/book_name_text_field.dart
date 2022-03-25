part of '../add_book_view.dart';

extension BookNameTextFieldExtention on AddBookView {
  CustomTextFieldBook bookNameTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextFieldBook(
        hintString: LocaleKeys.addBook_bookName.tr(),
        context: context,
        textController: reader.bookNameController,
        isObsecure: false,
        node: reader.bookNameFocus);
  }
}
