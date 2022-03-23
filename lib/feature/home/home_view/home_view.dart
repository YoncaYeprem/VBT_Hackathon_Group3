import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/feature/addBook/view/add_book_view.dart';
import '../../../product/widget/custom_text_field_search.dart';
import '../for_sale/view/for_sale_view.dart';
import '../home_viewmodel/cubit/homeview_cubit.dart';
import '../swap/view/swap_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController takipkontrol;

  @override
  void initState() {
    super.initState();
    takipkontrol = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeviewCubit>(
        create: (context) => HomeviewCubit(),
        child: BlocConsumer<HomeviewCubit, HomeviewState>(
          listener: (context, state) {},
          builder: (context, state) {
            return buildScaffold(context, state);
          },
        ));
  }

  Scaffold buildScaffold(BuildContext context, HomeviewState state) {
    return context.read<HomeviewCubit>().isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              actions: [
                Padding(
                  padding: context.horizontalPaddingLow,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      context.read<HomeviewCubit>().userModel?.photo ?? "",
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.navigateToPage(AddBookView());
              },
              child: Icon(Icons.add),
            ),
            body: Padding(
              padding: context.paddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back, Bunny!",
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    width: context.width * 0.6,
                    child: Text("What do you want to read today?",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: context.verticalPaddingMedium,
                    child: CustomTextFieldSearch(),
                  ),
                  Expanded(
                    child: _buildViewPageViewController(),
                  ),
                  const Text("data"),
                ],
              ),
            ),
          );
  }

  _buildViewPageViewController() {
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
                      "Takas",
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      "Satıs",
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
