part of '../add_book_view.dart';

extension LanguageTextField on AddBookView {
  CustomTextField languageTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextField(
        hintString: LocaleKeys.addBook_language.tr(),
        context: context,
        textController: reader.languageController,
        isObsecure: false,
        node: context.read<AddBookCubit>().languageFocus);
  }
}
