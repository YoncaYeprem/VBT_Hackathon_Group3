part of '../add_book_view.dart';

extension PriceTextField on AddBookView {
  CustomTextFieldBook priceTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextFieldBook(
        hintString: LocaleKeys.addBook_price.tr(),
        context: context,
        textController: reader.priceController,
        isObsecure: false,
        textInputType: TextInputType.number,
        node: context.read<AddBookCubit>().priceFocus);
  }
}
