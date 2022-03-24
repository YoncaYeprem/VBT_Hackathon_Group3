import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbt_hackathon_group3/feature/home/for_sale/viewmodel/cubit/saleview_cubit.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/product/constant/app_radius.dart';
import 'package:vbt_hackathon_group3/product/widget/custom_home_sale_swap_image.dart';

class SaleView extends StatelessWidget {
  const SaleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaleviewCubit(),
      child: BlocConsumer<SaleviewCubit, SaleviewState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SaleViewLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SaleViewComplited) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.bookModel?.length,
                itemBuilder: (context, index) {
                  final stateIndex = state.bookModel?[index];
                  return Padding(
                    padding: context.verticalPaddingNormal,
                    child: Container(
                      width: context.dynamicWidth(0.4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusCard.circular(),
                      ),
                      child: HomeSaleSwap(model: stateIndex!),
                    ),
                  );
                });
          }
          return const Text("");
        },
      ),
    );
  }
}
