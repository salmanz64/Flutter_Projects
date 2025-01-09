import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier {
  //item = [itemname,itemprice,itemimage,itemcolor]
  final List _items = [
    ["Apple", 80, "lib/images/apple.png", Colors.red],
    ["Banana", 50, "lib/images/banana.png", Colors.yellow],
    ["Pineapple", 150, "lib/images/pineapple.png", Colors.orange],
    ["Water Bottle", 10, "lib/images/waterbottle.png", Colors.blue],
  ];
  List _cartItems = [
    ["Banana", 50, "lib/images/banana.png", Colors.yellow],
  ];
  get items => _items;
  get cartItems => _cartItems;

  void addToCart(List<dynamic> item) {
    _cartItems.add(item);

    notifyListeners();
  }

  void deleteFromCart(index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalprice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalprice += cartItems[i][1];
    }
    return totalprice.toString();
  }
}
