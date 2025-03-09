import 'package:bubble_tea_app/pages/cart_page.dart';
import 'package:bubble_tea_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeOrCart extends StatefulWidget {
  const HomeOrCart({super.key});

  @override
  State<HomeOrCart> createState() => _HomeOrCartState();
}

class _HomeOrCartState extends State<HomeOrCart> {
  int selectedIndex = 0;

  List pages = [HomePage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu));
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text("Drawer Header")),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Profile"),
            ),
            ListTile(
              title: Text("Logout"),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.brown[200],
        padding: EdgeInsets.all(10),
        child: GNav(
            mainAxisAlignment: MainAxisAlignment.center,
            selectedIndex: selectedIndex,
            onTabChange: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.brown,
            tabBorderRadius: 10,
            gap: 10,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Shop",
              ),
              GButton(
                icon: Icons.card_travel,
                text: "Cart",
              )
            ]),
      ),
      body: pages[selectedIndex],
    );
  }
}
