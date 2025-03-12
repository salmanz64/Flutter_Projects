import 'package:bubble_tea_app/database/bubble_teashop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  BubbleTeashop bt = BubbleTeashop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: StreamBuilder(
        stream: bt.getDrinksStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List drinksList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: drinksList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = drinksList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Image.asset(
                        data['img'],
                      ),
                      title: Text(
                        data['itemName'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '\$${data['price'].toString()}',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            bt.removeFromCart(docID);
                          },
                          color: Colors.white,
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}
