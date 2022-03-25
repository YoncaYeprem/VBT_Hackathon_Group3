import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_hackathon_group3/feature/addBook/book_model/productmodel.dart';
import 'package:vbt_hackathon_group3/feature/bookDetail/view/book_detail_view.dart';

import '../constant/app_image.dart';
import '../constant/app_radius.dart';

class HomeArrivalWidget extends StatelessWidget {
  BookModel? bookModel;
  HomeArrivalWidget({
    Key? key,
    this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateToPage(BookDetailView(book: bookModel!)),
      child: Padding(
        padding: context.horizontalPaddingNormal,
        child: Container(
          margin: const EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadiusCard.circular(),
          ),
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            elevation: 5,
            child: ClipRRect(
              borderRadius: BorderRadiusCard.circular(),
              child: Image.network(
                bookModel?.photo ?? AppImageUrl().arrivalsUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}