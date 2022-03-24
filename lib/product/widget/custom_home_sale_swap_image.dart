import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/feature/addBook/book_model/productmodel.dart';
import 'package:vbt_hackathon_group3/product/constant/app_image.dart';
import 'package:vbt_hackathon_group3/product/constant/app_radius.dart';

import '../../feature/bookDetail/view/book_detail_view.dart';

class HomeSaleSwap extends StatelessWidget {
  BookModel? model;
  HomeSaleSwap({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookDetailView(book: model!)));
      },
      child: Column(
        children: [
          SizedBox(
            width: context.dynamicWidth(0.3),
            height: context.dynamicHeight(0.19),
            child: ClipRRect(
              borderRadius: BorderRadiusCard.circular(),
              child: Image.network(
                model?.photo ?? AppImageUrl().arrivalsUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: context.verticalPaddingLow,
            child: Text(model?.bookName ?? "",
                style: Theme.of(context).textTheme.bodyText2),
          ),
        ],
      ),
    );
  }
}