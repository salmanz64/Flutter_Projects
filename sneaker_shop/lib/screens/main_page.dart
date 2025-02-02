import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/data/cart.dart';
import 'package:sneaker_shop/screens/mydrawer.dart';
import 'package:sneaker_shop/utils/bottom_nav.dart';
import 'package:sneaker_shop/utils/product_card.dart';

class MainPage extends StatelessWidget {
  final Function(bool) ontap;
  MainPage({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: MyDrawer(),
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Everyone Flies...some flies longer than Others.",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hot Picks 🔥",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Consumer<Cart>(
                      builder: (context, value, child) {
                        return ProductCard(
                          name: value.shoes[index].name,
                          description: value.shoes[index].description,
                          img: value.shoes[index].img,
                          price: value.shoes[index].price,
                        );
                      },
                    );
                  },
                  itemCount: Provider.of<Cart>(context).shoes.length,
                ),
              ),
              const Divider(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNav(
          ontap: ontap,
          currentIndex: 0,
        ));
  }
}
