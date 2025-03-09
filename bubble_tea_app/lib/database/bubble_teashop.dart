import 'package:bubble_tea_app/model/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeashop extends ChangeNotifier {
  List<Drink> _items = [
    Drink(
        img: 'lib/assets/bubble_tea_1.png', itemName: 'Milk Tea', price: 3.13),
    Drink(
        img: 'lib/assets/bubble_tea_2.png',
        itemName: 'Cold Coffee',
        price: 5.27)
  ];

  List<Drink> _cart = [];

  List<Drink> get items => _items;
  List<Drink> get cart => _cart;

  void addToCart(Drink item) {
    cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Drink item) {
    cart.remove(item);
    notifyListeners();
  }
}
