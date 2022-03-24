import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:vbt_hackathon_group3/feature/home/home_view/home_view.dart';

import 'feature/myFavoritesPage/view/my_favorites_view.dart';
import 'feature/profile/view/profile_view.dart';

class DirectionPage extends StatefulWidget {
  const DirectionPage({Key? key}) : super(key: key);

  @override
  _DirectionPageState createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  int _aktifNo = 0;
  late PageController sayfaKumandasi;

  @override
  void initState() {
    super.initState();
    sayfaKumandasi = PageController();
  }

  @override
  void dispose() {
    sayfaKumandasi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (acilanSayfaNo) {
          setState(() {
            _aktifNo = acilanSayfaNo;
          });
        },
        controller: sayfaKumandasi,
        children: const [HomeView(), MyFavoritesView(), ProfileView()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        items: const <Icon>[
          Icon(Icons.home, size: 30),
          Icon(Icons.map, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Theme.of(context).backgroundColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (selectPage) {
          setState(() {
            sayfaKumandasi.jumpToPage(selectPage);
          });
        },
      ),
    );
  }
}
