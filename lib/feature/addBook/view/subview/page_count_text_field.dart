part of '../add_book_view.dart';

extension PageCountTextField on AddBookView {
  CustomTextField pageCountTextField(
      BuildContext context, AddBookCubit reader) {
    return CustomTextField(
        hintString: LocaleKeys.addBook_pageCount.tr(),
        context: context,
        textController: reader.pageCountController,
        isObsecure: false,
        node: context.read<AddBookCubit>().pageCountFocus);
  }
}
