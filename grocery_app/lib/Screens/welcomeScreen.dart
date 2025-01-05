import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/homeScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "lib/images/banana.png",
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "We deliver\nGroceries at your\ndoorstep",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Fresh  Items  everyday"),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(),
              )),
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
