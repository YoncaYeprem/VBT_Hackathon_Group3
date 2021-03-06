part of '../book_detail_view.dart';

extension BookImageExtension on BookDetailView {
  Container buildBookImage(BuildContext context, String? photoUrl) {
    var photo = photoUrl == ""
        ? "https://www.yunanadalariferibotlari.com/images/my_pictures/temp/notfound.png"
        : photoUrl;

    return Container(
      height: context.dynamicHeight(0.4),
      width: context.dynamicWidth(0.5),
      child: ClipRRect(
        borderRadius: context.normalBorderRadius,
        child: AspectRatio(
          aspectRatio: 1 / 2.5,
          child: Image(
            image: NetworkImage(photo ?? ""),
            fit: BoxFit.fill, // use this
          ),
        ),
      ),
    );
  }
}
