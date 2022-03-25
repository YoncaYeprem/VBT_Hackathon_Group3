part of '../book_detail_view.dart';

extension BookGoProfileButtonExtension on BookDetailView {
  Expanded goToBookOwnerButton(String userId, BuildContext context) {
    return Expanded(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  OtherProfilePage(userId:userId),
                    ));
              },
              child: const Text("Go To Profile")));
  }
}
