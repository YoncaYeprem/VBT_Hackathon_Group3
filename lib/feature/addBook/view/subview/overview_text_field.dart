part of '../add_book_view.dart';

extension OverviewTextField on AddBookView {
  CustomTextFieldBook overviewTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextFieldBook(
        hintString: LocaleKeys.addBook_bookOverview.tr(),
        context: context,
        textController: reader.overviewController,
        isObsecure: false,
        maxLines: 4,
        node: context.read<AddBookCubit>().overviewFocus);
  }
}
