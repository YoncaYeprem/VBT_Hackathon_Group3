part of '../book_detail_view.dart';

extension BookGoProfileButtonExtension on BookDetailView {
  Expanded goToBookOwnerButton(BuildContext context) {
    return Expanded(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyFavoritesView(),
                    ));
              },
              child: const Text("Go To Profile")));
  }
}
