import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Center(child: Text("Hello")),
            decoration: BoxDecoration(
                //foregrond color and backgrond should be same
                color: Colors.deepPurple[300],
                shape: BoxShape.circle,
                boxShadow: [
                  //bottom right shadow
                  BoxShadow(
                      color: Colors.deepPurple.shade700,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1),
                  // top left shadow
                  BoxShadow(
                      color: Colors.deepPurple.shade200,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurple.shade200,
                      Colors.deepPurple.shade400
                    ],
                    stops: [
                      0.1,
                      0.9
                    ])),
          ),
        ),
      ),
    );
  }
}
