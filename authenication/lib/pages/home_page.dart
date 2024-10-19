import 'package:authenication/components/my_post_button.dart';
import 'package:authenication/database/firestore.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FireStoreFirebase database = FireStoreFirebase();

  final TextEditingController postController = TextEditingController();

  void postMessage() {
    if (postController.text.isNotEmpty) {
      database.addPost(postController.text);
    }
    postController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Home Page'),
        ),
        drawer: const MyDrawer(),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: postController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: "Say Something")),
                ),
                const SizedBox(width: 10),
                MyPostButton(onTap: postMessage)
              ],
            ),
          ),
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final posts = snapshot.data!.docs;

              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('No Posts'),
                ));
              }

              return Expanded(
                  child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  String message = post["PostMessage"];
                  String userEmail = post["UserEmail"];

                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25, bottom: 25),
                    child: ListTile(
                      title: Text(message),
                      subtitle: Text(
                        userEmail,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  );
                },
              ));
            },
          )
        ]));
  }
}
