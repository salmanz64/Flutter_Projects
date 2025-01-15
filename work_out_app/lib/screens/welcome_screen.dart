import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/workout.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Workout\nBuddy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Track your daily workout and watch you\nprogress grow!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 100,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black87),
                    child: const Center(
                        child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
