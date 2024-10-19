import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int num1 = 0;
  int num2 = 0;
  int result = 0;
  String? op;
  bool isOp = false;
  String display = "";

  void pass1(int newnum) {
    num1 = num1 * 10 + newnum;
  }

  void pass2(int newnum) {
    num2 = num2 * 10 + newnum;

    calc(num1, num2, op!);
  }

  void calc(int num1, int num2, String op) {
    switch (op) {
      case "+":
        result = num1 + num2;
        break;
      case "-":
        result = num1 - num2;
        break;
      case "*":
        result = num1 * num2;
        break;
      case "/":
        result = num1 ~/ num2;
        break;
      case "%":
        result = num1 % num2;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF598392),
        body: Column(children: [
          Expanded(
              child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.topLeft,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      display,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  color: Colors.blueGrey,
                ))
              ],
            ),
          )),
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
                      child: GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: ClipRRect(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFD151B),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  "Del",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ))),
                          )),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              display = "";
                            });
                          },
                          child: ClipRRect(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  "C",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ))),
                          )),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            if (isOp == false) {
                              isOp = true;
                              op = "%";
                            } else if (isOp == true && op != "%") {
                              op = "%";
                            } else {
                              return;
                            }
                            display += "%";
                          },
                          child: ClipRRect(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF01295F),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  "%",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ))),
                          )),
                    )),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF01295F),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "/",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ),
                            ))),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(7);
                                } else {
                                  pass2(7);
                                }
                                setState(() {
                                  display += "7";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "7",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(8);
                                } else {
                                  pass2(8);
                                }
                                setState(() {
                                  display += "8";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "8",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(9);
                                } else {
                                  pass2(9);
                                }
                                setState(() {
                                  display += "9";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "9",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF01295F),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "x",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ),
                            ))),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(4);
                                } else {
                                  pass2(4);
                                }
                                setState(() {
                                  display += "4";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "4",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(5);
                                } else {
                                  pass2(5);
                                }
                                setState(() {
                                  display += "5";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "5",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(6);
                                } else {
                                  pass2(6);
                                }
                                setState(() {
                                  display += "6";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "6",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF01295F),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ),
                            ))),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(1);
                                } else {
                                  pass2(1);
                                }
                                setState(() {
                                  display += "1";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "1",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(2);
                                } else {
                                  pass2(2);
                                }
                                setState(() {
                                  display += "2";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "2",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (isOp == false) {
                                  pass1(3);
                                } else {
                                  pass2(3);
                                }
                                setState(() {
                                  display += "3";
                                });
                              },
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "3",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF01295F),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ),
                            ))),
                  ]),
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      "0",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      ".",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      "Ans",
                                      style: TextStyle(fontSize: 25),
                                    ))),
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF01295F),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      "=",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ),
                            ))),
                  ]),
                ),
              ])))
        ]),
      ),
    );
  }
}
