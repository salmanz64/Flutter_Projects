import 'package:bubble_tea_app/components/my_button.dart';
import 'package:bubble_tea_app/database/bubble_teashop.dart';
import 'package:bubble_tea_app/model/drink.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  Drink drink;
  ItemPage({super.key, required this.drink});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  double sweet = 0;
  double ice = 0;
  double pearls = 0;

  BubbleTeashop bt = BubbleTeashop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
      ),
      backgroundColor: Colors.brown[400],
      body: Column(
        children: [
          Image.asset(widget.drink.img),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Sweet",
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                thumbColor: Colors.brown[700],
                activeColor: Colors.brown[700],
                value: sweet,
                onChanged: (value) {
                  setState(() {
                    sweet = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Ice",
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                thumbColor: Colors.brown[700],
                activeColor: Colors.brown[700],
                value: ice,
                onChanged: (value) {
                  setState(() {
                    ice = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Pearls",
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                thumbColor: Colors.brown[700],
                activeColor: Colors.brown[700],
                value: pearls,
                onChanged: (value) {
                  setState(() {
                    pearls = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          GestureDetector(
              onTap: () => bt.addToCart(widget.drink),
              child: MyButton(text: "Add To Cart"))
        ],
      ),
    );
  }
}
