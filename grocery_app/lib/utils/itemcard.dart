import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  String item;
  int price;
  String image;
  MaterialColor color;
  void Function()? onTap;
  ItemCard(
      {super.key,
      required this.item,
      required this.price,
      required this.image,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color[100], borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Image.asset(
              image,
              height: 120,
            ),
            Text(item),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              width: 60,
              child: MaterialButton(
                color: color,
                onPressed: onTap,
                child: Center(child: Text(price.toString())),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
