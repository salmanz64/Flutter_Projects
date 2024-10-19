import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Users Page'),
        ),
        drawer: const MyDrawer(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Text("Error");
            } else if (snapshot.hasData) {
              final users = snapshot.data!.docs;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user['username']),
                    subtitle: Text(user['email']),
                  );
                },
                itemCount: users.length,
              );
            } else {
              return const Text("No Data");
            }
          },
        ));
  }
}
