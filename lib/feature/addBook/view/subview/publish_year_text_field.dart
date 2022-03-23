part of '../add_book_view.dart';

extension PublishYearTextField on AddBookView {
  CustomTextField publishYearTextField(
      BuildContext context, AddBookCubit reader) {
    return CustomTextField(
        hintString: LocaleKeys.addBook_publisherYear.tr(),
        context: context,
        textController: reader.publishYearController,
        isObsecure: false,
        node: context.read<AddBookCubit>().publishYearFocus);
  }
}
