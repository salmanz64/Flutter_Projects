import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/data/cart.dart';

class ProductCard extends StatelessWidget {
  String name;
  double price;
  String img;
  String description;

  ProductCard(
      {super.key,
      required this.name,
      required this.description,
      required this.img,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 120,
        width: 320,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                img,
                height: 300,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            price.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Provider.of<Cart>(context, listen: false)
                          .addToCart(description, price, img, name),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
