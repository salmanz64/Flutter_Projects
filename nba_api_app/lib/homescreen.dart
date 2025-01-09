import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_api_app/model/charactermodel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List char = [];

  Future getTeams() async {
    final response =
        await http.get(Uri.http('api.disneyapi.dev', '/character'));
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    for (var characters in jsonData['data']) {
      var character = Character(name: characters["name"]);
      char.add(character);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disney Characters"),
      ),
      body: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(char[index].name),
                  );
                },
                itemCount: char.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
