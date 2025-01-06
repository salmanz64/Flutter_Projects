import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/cartscreen.dart';
import 'package:grocery_app/model/cartmodel.dart';
import 'package:grocery_app/utils/itemcard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Good Morning"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lets order Fresh\nitems for you ",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60,
              ),
              Text("Fresh Items"),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Consumer<Cartmodel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.1, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return ItemCard(
                          item: value.items[index][0],
                          price: value.items[index][1],
                          image: value.items[index][2],
                          color: value.items[index][3],
                        );
                      },
                      itemCount: value.items.length,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CartScreen(),
            ));
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
