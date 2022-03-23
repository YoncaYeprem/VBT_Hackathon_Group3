import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_dropdown_button.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_radio_button.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_text_field.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../view_model/cubit/add_book_cubit.dart';
part './subview/author_text_field.dart';
part './subview/book_name_text_field.dart';
part './subview/language_text_field.dart';
part './subview/select_category_dropdown_button.dart';
part './subview/overview_text_field.dart';
part './subview/page_count_text_field.dart';
part './subview/price_text_field.dart';
part './subview/publish_year_text_field.dart';
part './subview/publisher_text_field.dart';
part './subview/select_image.dart';
part './subview/add_book_app_bar.dart';
part './subview/exchange_radio_button.dart';

class AddBookView extends StatelessWidget {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddBookCubit>(
      create: (context) => AddBookCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: addBookAppBar(context),
          body: SingleChildScrollView(
            child: BlocConsumer<AddBookCubit, AddBookState>(
              listener: (context, state) {
                IsExchange();
                AddBookonChange();
                AddBookComplete();
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 8, left: 8, bottom: 8),
                      child: bookNameTextField(
                          context, context.read<AddBookCubit>()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: authorTextField(
                          context, context.read<AddBookCubit>()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: selectCategoryDropDownButton(
                            context, context.read<AddBookCubit>()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: overviewTextField(
                          context, context.read<AddBookCubit>()),
                    ),
                    exchangeRadioButton(context),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width:
                                context.read<AddBookCubit>().groupValue == true
                                    ? context.mediaQuery.size.width * 0.54
                                    : context.mediaQuery.size.width * 0.38,
                            child: languageTextField(
                                context, context.read<AddBookCubit>()),
                          ),
                          SizedBox(
                            width:
                                context.read<AddBookCubit>().groupValue == true
                                    ? context.mediaQuery.size.width * 0.38
                                    : context.mediaQuery.size.width * 0.25,
                            child: pageCountTextField(
                                context, context.read<AddBookCubit>()),
                          ),
                          context.read<AddBookCubit>().groupValue == false
                              ? SizedBox(
                                  width: context.mediaQuery.size.width * 0.25,
                                  child: priceTextField(
                                      context, context.read<AddBookCubit>()),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 25,
                      thickness: 2,
                      endIndent: 15,
                      indent: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: context.mediaQuery.size.width * 0.55,
                          child: publisherTextField(
                              context, context.read<AddBookCubit>()),
                        ),
                        SizedBox(
                          width: context.mediaQuery.size.width * 0.25,
                          child: publishYearTextField(
                              context, context.read<AddBookCubit>()),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child:
                            selectImage(context, context.read<AddBookCubit>()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: context.mediaQuery.size.width,
                        height: context.mediaQuery.size.width * 0.12,
                        child: ElevatedButton(
                            onPressed: () {
                              context.read<AddBookCubit>().addBook();
                            },
                            child: Text(LocaleKeys.addBook_addButton.tr())),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
