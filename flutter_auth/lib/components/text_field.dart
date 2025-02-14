import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final void Function()? onTap;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onTap,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    );
  }
}
