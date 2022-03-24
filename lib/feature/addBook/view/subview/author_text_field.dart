part of '../add_book_view.dart';

extension AuthorTextFieldExtention on AddBookView {
  CustomTextFieldBook authorTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextFieldBook(
        hintString: LocaleKeys.addBook_autherName.tr(),
        context: context,
        textController: reader.autherController,
        isObsecure: false,
        node: context.read<AddBookCubit>().autherFocus);
  }
}
