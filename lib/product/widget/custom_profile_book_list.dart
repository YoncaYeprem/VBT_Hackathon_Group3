import 'package:flutter/material.dart';

class ProfileBookList extends StatelessWidget {
  const ProfileBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        listCard(),
        listCard(),
        listCard(),
        listCard(),
        listCard(),
      ],
    );
  }
}

Widget listCard() {
  return Card(
    elevation: 10,
    child: ListTile(
      leading: CircleAvatar(child: Image.asset("assets/images/dummy_per.png")),
      trailing: const Text("Boook info"),
      title: const Text("Book Title"),
      subtitle: const Text("Book info"),
    ),
  );
}
