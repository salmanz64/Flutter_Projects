import 'package:bubble_tea_app/model/drink.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  Drink drink;
  ItemPage({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(drink.img),
          Slider(
            value: 0,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
