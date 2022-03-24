import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/core/init/locale/locale_manager.dart';
import 'package:vbt_hackathon_group3/feature/addBook/view/add_book_view.dart';
import 'package:vbt_hackathon_group3/product/utils/cache/cache_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/utils/cache/user_manager.dart';
import '../../../product/widget/custom_home_arrival.dart';
import '../../../product/widget/custom_text_field_search.dart';
import '../../profile/view/profile_view.dart';
import '../for_sale/view/for_sale_view.dart';
import '../home_viewmodel/cubit/homeview_cubit.dart';
import '../nested_scroll_view/nested_scroll_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeviewCubit>(
        create: (context) => HomeviewCubit(),
        child: BlocConsumer<HomeviewCubit, HomeviewState>(
          listener: (context, state) {
            if (state is HomeViewFailed) {
              return;
            }
          },
          builder: (context, state) {
            return buildScaffold(context, state);
          },
        ));
  }

  Scaffold buildScaffold(BuildContext context, HomeviewState state) {
    if (state is HomeViewLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is HomeViewComplited) {
      return Scaffold(
        appBar: _appBarWidget(context),
        floatingActionButton: _actionButtonWidget(context),
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeTextWidget(context),
              _informationTextWidget(context),
              _customTextFiledSearch(context),
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _customSwapAndSale(context),
                        _buildTextNewBook(context),
                        _buildNewArrivals(context, state),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Padding _buildNewArrivals(BuildContext context, HomeViewComplited state) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: SizedBox(
        height: context.height,
        child: GridView.builder(
            itemCount: state.bookModel?.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final item = state.bookModel?[index];
              return HomeArrivalWidget(
                bookModel: item,
              );
            }),
      ),
    );
  }

  Padding _buildTextNewBook(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Text(
        LocaleKeys.home_addNew.tr(),
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 24,
            ),
      ),
    );
  }

  SizedBox _customSwapAndSale(BuildContext context) {
    return SizedBox(
      height: context.height * 0.35,
      child: const NestedScrollViewHome(),
    );
  }

  Padding _customTextFiledSearch(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingMedium,
      child: const CustomTextFieldSearch(),
    );
  }

  AppBar _appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: [
        _appBarProfilePhotoWidget(context),
      ],
    );
  }

  Padding _appBarProfilePhotoWidget(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          context.read<HomeviewCubit>().userModel?.photo ?? "",
        ),
      ),
    );
  }

  FloatingActionButton _actionButtonWidget(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.navigateToPage(const AddBookView());
      },
      child: const Icon(Icons.add),
    );
  }

  SizedBox _informationTextWidget(BuildContext context) {
    return SizedBox(
      width: context.width * 0.6,
      child: Text(LocaleKeys.home_info.tr(),
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500)),
    );
  }

  Text _welcomeTextWidget(BuildContext context) {
    return Text(
        "${LocaleKeys.home_welcome.tr()}${context.read<HomeviewCubit>().userModel?.firstname ?? ""}",
        style: Theme.of(context).textTheme.headline6);
  }
}