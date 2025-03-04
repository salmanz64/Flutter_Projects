import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  MyButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[700], borderRadius: BorderRadius.circular(10)),
      width: width - 50,
      height: height * 0.08,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
