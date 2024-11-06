import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF122D42),
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('lib/assets/logo.png'),
                  height: 280,
                  width: 280,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  child: Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
