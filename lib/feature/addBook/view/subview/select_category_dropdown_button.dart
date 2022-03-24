part of '../add_book_view.dart';

extension SelectCategoryDropDownButton on AddBookView {
  CustomDropDownButton selectCategoryDropDownButton(
      BuildContext context, AddBookCubit reader) {
    return CustomDropDownButton(
        items: context.read<AddBookCubit>().category,
        onChanged: (value) {
          reader.changeSelectItems(value);
        },
        selectedValue: context.read<AddBookCubit>().selectedValue,
        tittleText: context.read<AddBookCubit>().tittleText);
  }
}
