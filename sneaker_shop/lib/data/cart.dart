import 'package:flutter/material.dart';
import 'package:sneaker_shop/data/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoes = [
    Shoe(
        name: "Shadow Stride X1",
        description:
            "A sleek, all-black sneaker designed for ultimate comfort and street-style appeal. The breathable mesh upper and cushioned sole provide all-day support.",
        price: 129.99,
        img: 'lib/assets/shoes/shoes_1.png'),
    Shoe(
        name: "Volt Runner Pro",
        description:
            "High-performance running shoes with a neon green finish and shock-absorbing soles. Perfect for both casual joggers and serious marathoners.",
        price: 149.99,
        img: 'lib/assets/shoes/shoes_2.png'),
    Shoe(
        name: "Titan Force Max",
        description:
            " Lightweight and stylish, these sneakers feature a futuristic design with premium knit fabric, ideal for urban explorers and gym-goers alike",
        price: 159.99,
        img: 'lib/assets/shoes/shoes_3.png'),
    Shoe(
        name: "SAeroSwift Blaze",
        description:
            "A sleek, all-black sneaker designed for ultimate comfort and street-style appeal. The breathable mesh upper and cushioned sole provide all-day support.",
        price: 119.99,
        img: 'lib/assets/shoes/shoes_4.png')
  ];

  List<Shoe> _cart = [];

  List viewCart() {
    return _cart;
  }

  void addToCart(String desc, double price, String img, String name) {
    _cart.add(Shoe(description: desc, price: price, img: img, name: name));
    notifyListeners();
  }

  void deleteFromCart(String name) {
    _cart.removeWhere((element) => element.name == name);
    notifyListeners();
  }
}
