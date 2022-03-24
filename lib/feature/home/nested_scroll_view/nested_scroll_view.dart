import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/lang/locale_keys.g.dart';

import '../for_sale/view/for_sale_view.dart';
import '../swap/view/swap_view.dart';

class NestedScrollViewHome extends StatefulWidget {
  const NestedScrollViewHome({Key? key}) : super(key: key);

  @override
  State<NestedScrollViewHome> createState() => _NestedScrollViewHomeState();
}

late TabController takipkontrol;

class _NestedScrollViewHomeState extends State<NestedScrollViewHome>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    takipkontrol = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return _nestedScrollView();
  }

  NestedScrollView _nestedScrollView() {
    return _swapAndSaleScroll();
  }

  NestedScrollView _swapAndSaleScroll() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            title: TabBar(
              indicatorColor: context.appTheme.primaryColor,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.label,
              controller: takipkontrol,
              tabs: [
                Tab(
                  child: Center(
                    child: Text(
                      LocaleKeys.home_swap.tr(),
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      LocaleKeys.home_sale.tr(),
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: takipkontrol,
        children: const [
          SwapView(),
          SaleView(),
        ],
      ),
    );
  }
}
