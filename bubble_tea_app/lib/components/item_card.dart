import 'package:bubble_tea_app/model/drink.dart';
import 'package:bubble_tea_app/pages/item_page.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  Drink drink;
  ItemCard({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.brown[700], borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Image.asset(
            drink.img,
          ),
          title: Text(
            drink.itemName,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            '\$${drink.price.toString()}',
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemPage(drink: drink),
                ));
              },
              color: Colors.white,
              icon: Icon(Icons.arrow_right_alt_outlined)),
        ),
      ),
    );
  }
}
