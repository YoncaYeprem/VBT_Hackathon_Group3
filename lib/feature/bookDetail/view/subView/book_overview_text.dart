part of '../book_detail_view.dart';

extension BookOverviewTextExtension on BookDetailView {
  Padding overviewText(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.bookDetail_overview.tr(),
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Text(
            book.overview ?? "",
            textAlign: TextAlign.justify,
            style: context.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
