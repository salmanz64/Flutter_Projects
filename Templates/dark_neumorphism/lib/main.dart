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
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Container(
            child: Text("Hello"),
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
                //foregrond color and backgrond should be same
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  //bottom right shadow
                  BoxShadow(
                      color: Colors.black,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 5),
                  // top left shadow
                  BoxShadow(
                      color: Colors.grey.shade800,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1)
                ]),
          ),
        ),
      ),
    );
  }
}
