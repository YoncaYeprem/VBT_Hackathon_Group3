part of '../add_book_view.dart';

extension AuthorTextFieldExtention on AddBookView {
  CustomTextField authorTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextField(
        hintString: LocaleKeys.addBook_autherName.tr(),
        context: context,
        textController: reader.autherController,
        isObsecure: false,
        node: context.read<AddBookCubit>().autherFocus);
  }
}
