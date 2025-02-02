import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/data/cart.dart';

class CartCard extends StatelessWidget {
  String name, image;
  double price;
  CartCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.all(16),
        tileColor: Colors.white,
        leading: Image.asset(image),
        title: Text(name),
        subtitle: Text(price.toString()),
        trailing: IconButton(
          onPressed: () =>
              Provider.of<Cart>(context, listen: false).deleteFromCart(name),
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
