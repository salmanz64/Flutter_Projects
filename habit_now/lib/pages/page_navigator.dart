import 'package:flutter/material.dart';
import 'package:habit_now/pages/habit_page.dart';
import 'package:habit_now/pages/home_page.dart';
import 'package:habit_now/pages/timer_page.dart';
import 'package:habit_now/styles/text_styles.dart';

class PageNavigator extends StatefulWidget {
  PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int _selectIndex = 0;

  List pages = [HomePage(), HabitPage(), TimerPage()];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
                color: Colors.blue,
              ),
        ),

        title: Text(
          "Today",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: width * 0.03),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.calendar_month, color: Colors.white),
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: Colors.black,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Habit",
                        style: TextStyle(
                          color: Colors.blue.shade300,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(width: width * 0.001),
                      Text(
                        "Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Tuesday",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text("March 18, 2025", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Divider(
                  thickness: 0.4,
                  color: Colors.grey,
                  height: 0.02,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text("Home", style: whiteText),
                ),
                ListTile(
                  leading: Icon(Icons.timer, color: Colors.white),
                  title: Text("Timer", style: whiteText),
                ),
                ListTile(
                  leading: Icon(Icons.category, color: Colors.white),
                  title: Text("Categories", style: whiteText),
                ),
              ],
            ),
          ],
        ),
      ),
      body: pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (value) {
          setState(() {
            _selectIndex = value;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "Today"),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_symbols_sharp),
            label: "Habits",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Timer"),
        ],
      ),
    );
  }
}
