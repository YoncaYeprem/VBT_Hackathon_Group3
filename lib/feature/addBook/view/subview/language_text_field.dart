part of '../add_book_view.dart';

extension LanguageTextField on AddBookView {
  CustomTextFieldBook languageTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextFieldBook(
        hintString: LocaleKeys.addBook_language.tr(),
        context: context,
        textController: reader.languageController,
        isObsecure: false,
        node: context.read<AddBookCubit>().languageFocus);
  }
}
