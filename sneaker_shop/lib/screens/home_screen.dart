import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/cart_page.dart';
import 'package:sneaker_shop/screens/main_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool home = true;

  void setTabChange(bool val) {
    setState(() {
      home = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (home) {
      return MainPage(
        ontap: setTabChange,
      );
    } else {
      return CartPage(
        ontap: setTabChange,
      );
    }
  }
}
