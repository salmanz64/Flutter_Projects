import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/pages/Add%20Habit/category_page.dart';
import 'package:habit_now/pages/Edit%20Habit/edit_page.dart';
import 'package:habit_now/pages/habit_page.dart';
import 'package:habit_now/pages/home_page.dart';
import 'package:habit_now/pages/settings/settingspage.dart';
import 'package:habit_now/pages/timer_page.dart';
import 'package:habit_now/styles/text_styles.dart';
import 'package:provider/provider.dart';

class PageNavigator extends StatefulWidget {
  Habit? hb;
  PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  bool showOption = false;
  bool isSearching = false;
  int _selectIndex = 0;

  late List pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      HabitPage(onTap: displayOption), // Now works
      TimerPage(),
    ];
  }

  void displayOption(Habit targethb) {
    setState(() {
      widget.hb = targethb;
      showOption = !showOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomSheet:
          showOption
              ? Container(
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => EditPage(
                                    hb: widget.hb,
                                    onTap: displayOption,
                                  ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(width: 20),
                            Text("Edit"),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Provider.of<HabitData>(
                            context,
                            listen: false,
                          ).deleteHabit(widget.hb!.title);

                          setState(() {
                            showOption = !showOption;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(width: 20),
                            Text("Delete"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : SizedBox(),

      appBar:
          isSearching
              ? AppBar(
                automaticallyImplyLeading: false, // Remove leading icon (menu)
                backgroundColor: Theme.of(context).colorScheme.surface,
                // Remove the default spacing around the title
                title: SearchBar(
                  leading: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onChanged: (value) {
                    Provider.of<HabitData>(
                      context,
                      listen: false,
                    ).filterHabit(value);
                  },
                  trailing: [
                    IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        setState(() {
                          isSearching = !isSearching;
                        });
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                  hintStyle: WidgetStateProperty.all(
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  textStyle: WidgetStateProperty.all(
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.surface,
                  ),
                ),
              )
              : AppBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                leading: Builder(
                  builder:
                      (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),

                title: Text(
                  "Today",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                actions:
                    isSearching
                        ? []
                        : [
                          GestureDetector(
                            onTap:
                                () => {
                                  setState(() {
                                    isSearching = !isSearching;
                                  }),
                                },
                            child: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
              ),

      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,

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
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Tuesday",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                    ),
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
                GestureDetector(
                  onTap:
                      () => {
                        setState(() {
                          _selectIndex = 0;
                        }),
                        Navigator.of(context).pop(),
                      },
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => {
                        setState(() {
                          _selectIndex = 2;
                        }),
                        Navigator.of(context).pop(),
                      },
                  child: ListTile(
                    leading: Icon(
                      Icons.timer,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      "Timer",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => {
                        setState(() {
                          _selectIndex = 1;
                        }),
                        Navigator.of(context).pop(),
                      },
                  child: ListTile(
                    leading: Icon(
                      Icons.category,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      "Habits ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settingspage()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
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
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surface,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "Today"),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_symbols_sharp),
            label: "Habits",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Timer"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CategoryPage()));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
