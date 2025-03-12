import 'package:bubble_tea_app/auth/auth_service.dart';
import 'package:bubble_tea_app/components/item_card.dart';
import 'package:bubble_tea_app/database/bubble_teashop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: Consumer<BubbleTeashop>(
        builder: (context, value, child) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Bubble Tea shop",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.items.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        drink: value.items[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
