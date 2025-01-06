import 'package:flutter/material.dart';
import 'package:grocery_app/model/cartmodel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My cart"),
        ),
        body: Consumer<Cartmodel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Image.asset(value.cartItems[index][2]),
                            title: Text(value.cartItems[index][0]),
                            subtitle: Text(
                                "\$" + value.cartItems[index][1].toString()),
                            trailing: Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                    itemCount: value.cartItems.length,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
