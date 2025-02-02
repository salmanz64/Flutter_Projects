import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Image.asset(
                'lib/assets/logo/sneaker_logo.png',
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 25,
                ),
                title: Text(
                  "About",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
