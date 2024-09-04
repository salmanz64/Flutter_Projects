import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF598392),
        body: Column(children: [
          Expanded(child: Container()),
          Expanded(
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFD151B),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "Del",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "C",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF01295F),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "%",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF01295F),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "/",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ))),
                      ),
                    )),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "7",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "8",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "9",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF01295F),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "x",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ))),
                      ),
                    )),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "4",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "5",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "6",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF01295F),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "-",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ))),
                      ),
                    )),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "1",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "2",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "3",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF01295F),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                                child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ))),
                      ),
                    )),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              "0",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              ".",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              "Ans",
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRect(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF01295F),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              "=",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ))),
                      ),
                    )),
                  ]),
                ),
              ])))
        ]),
      ),
    );
  }
}
