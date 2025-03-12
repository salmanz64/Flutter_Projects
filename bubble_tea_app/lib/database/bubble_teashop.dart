import 'package:bubble_tea_app/model/drink.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BubbleTeashop extends ChangeNotifier {
  final List<Drink> _items = [
    Drink(
        img: 'lib/assets/bubble_tea_1.png',
        itemName: 'Milk Tea',
        price: 3.13,
        ice: 20,
        pearls: 40,
        sweet: 60),
    Drink(
        img: 'lib/assets/bubble_tea_2.png',
        itemName: 'Cold Coffee',
        ice: 30,
        pearls: 50,
        sweet: 60,
        price: 5.27)
  ];

  final CollectionReference drinks =
      FirebaseFirestore.instance.collection('notes');

  List<Drink> _cart = [];

  List<Drink> get items => _items;
  List<Drink> get cart => _cart;

  Future<void> addToCart(Drink item) async {
    cart.add(item);
    drinks.add({
      'itemName': item.itemName,
      'price': item.price,
      'img': item.img,
      'sweet': item.sweet,
      'pearls': item.pearls,
      'ice': item.ice
    });
    notifyListeners();
  }

  Future<void> removeFromCart(String docID) async {
    drinks.doc(docID).delete();
    notifyListeners();
  }

  Stream<QuerySnapshot> getDrinksStream() {
    final drinksStream = drinks.snapshots();
    return drinksStream;
  }
}
