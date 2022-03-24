part of '../add_book_view.dart';

extension PageCountTextField on AddBookView {
  CustomTextFieldBook pageCountTextField(
      BuildContext context, AddBookCubit reader) {
    return CustomTextFieldBook(
        hintString: LocaleKeys.addBook_pageCount.tr(),
        context: context,
        textController: reader.pageCountController,
        isObsecure: false,
        node: context.read<AddBookCubit>().pageCountFocus);
  }
}
