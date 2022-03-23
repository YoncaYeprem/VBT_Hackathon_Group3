part of '../add_book_view.dart';

extension PublisherTextField on AddBookView {
  CustomTextField publisherTextField(
      BuildContext context, AddBookCubit reader) {
    return CustomTextField(
        hintString: LocaleKeys.addBook_publisher.tr(),
        context: context,
        textController: reader.publisherController,
        isObsecure: false,
        node: context.read<AddBookCubit>().publisherFocus);
  }
}
