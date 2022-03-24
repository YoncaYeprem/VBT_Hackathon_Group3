import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../feature/myFavoritesPage/view/my_favorites_view.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Ayarlar"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Kitaplarim"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.navigateToPage(const MyFavoritesView());
            },
            child: const Card(
              child: ListTile(
                title: Text("Favorilerim"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
