import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sneaker_shop/screens/home_screen.dart';

class BottomNav extends StatefulWidget {
  final Function(bool) ontap;
  int currentIndex;
  BottomNav({super.key, required this.ontap, required this.currentIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          selectedIndex: widget.currentIndex,
          onTabChange: (value) {
            widget.ontap(value == 0);
          },
          color: Colors.grey[400],
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.white,
          activeColor: Colors.grey.shade700,
          tabBorderRadius: 16,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
          ]),
    );
  }
}
