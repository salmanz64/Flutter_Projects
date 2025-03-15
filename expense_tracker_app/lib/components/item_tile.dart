import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  String itemName;
  DateTime dateTime;
  double price;
  ItemTile(
      {super.key,
      required this.dateTime,
      required this.itemName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemName),
      subtitle: Text(dateTime.toString()),
      trailing: Text(price.toString()),
    );
    ;
  }
}
