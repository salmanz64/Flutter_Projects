import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  static void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          DrawerHeader(
            child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text('H O M E'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/home_page');
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text('P R O F I L E'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/profile_page');
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text('U S E R S'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/users_page');
              },
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.home),
            title: const Text('L O G O U T'),
            onTap: () {
              Navigator.of(context).pop();
              MyDrawer.logout();
              Navigator.of(context).pushReplacementNamed('/login_register');
            },
          ),
        ),
      ],
    ));
  }
}
