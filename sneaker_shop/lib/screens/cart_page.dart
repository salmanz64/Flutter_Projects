import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/data/cart.dart';
import 'package:sneaker_shop/screens/mydrawer.dart';
import 'package:sneaker_shop/utils/bottom_nav.dart';
import 'package:sneaker_shop/utils/cart_card.dart';

class CartPage extends StatelessWidget {
  final Function(bool) ontap;
  CartPage({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 40,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        ontap: ontap,
        currentIndex: 1,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Cart",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Consumer<Cart>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.viewCart().length,
                      itemBuilder: (context, index) {
                        return CartCard(
                          name: value.viewCart()[index].name,
                          price: value.viewCart()[index].price,
                          image: value.viewCart()[index].img,
                        );
                      },
                    );
                  },
                ),
              ),
              Center(
                child: SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Pay Now",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
