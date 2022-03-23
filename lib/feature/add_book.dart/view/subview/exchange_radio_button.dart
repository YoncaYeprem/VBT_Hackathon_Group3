part of '../add_book_view.dart';

extension ExchangeRadioButton on AddBookView {
  Row exchangeRadioButton(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 180,
          child: CustomRadioButton(
            title: LocaleKeys.addBook_exchange.tr(),
            value: true,
            groupValue: context.read<AddBookCubit>().groupValue,
            onChanged: (val) {
              context.read<AddBookCubit>().isExchange(val);
            },
          ),
        ),
        SizedBox(
          width: 180,
          child: CustomRadioButton(
            title: LocaleKeys.addBook_sell.tr(),
            value: false,
            groupValue: context.read<AddBookCubit>().groupValue,
            onChanged: (val) {
              context.read<AddBookCubit>().isExchange(val);
            },
          ),
        )
      ],
    );
  }
}
