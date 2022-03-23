part of '../add_book_view.dart';

extension PriceTextField on AddBookView {
  CustomTextField priceTextField(BuildContext context, AddBookCubit reader) {
    return CustomTextField(
        hintString: LocaleKeys.addBook_price.tr(),
        context: context,
        textController: reader.priceController,
        isObsecure: false,
        textInputType: TextInputType.number,
        node: context.read<AddBookCubit>().priceFocus);
  }
}
