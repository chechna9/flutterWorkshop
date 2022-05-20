import 'package:flutter/material.dart';
import 'package:simple_app/contact_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ContactCard(
        name: "Yacine",
        phoneNumber: "0557042274",
      ),
    );
  }
}
