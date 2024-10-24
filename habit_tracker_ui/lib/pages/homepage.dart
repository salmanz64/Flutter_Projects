import 'package:flutter/material.dart';
import 'package:habit_tracker_ui/components/dateCard.dart';
import 'package:habit_tracker_ui/components/habitCard.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  List<List> categories = [
    [Icons.directions_run, "Work Out"],
    [Icons.food_bank, "Eat Food"],
    [Icons.music_note, "Music"],
    [Icons.design_services_outlined, "Art & design"],
    [Icons.travel_explore, "Travellling"],
    [Icons.menu_book_rounded, "Read book"],
    [Icons.gamepad, "Gaming"],
    [Icons.settings, "Mechanic"]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.black,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.network_cell,
                  color: Colors.black,
                ),
                label: 'Settings'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: 'Settings'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: 'Settings'),
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.category),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                ),
                Text(
                  "Wednesday,24",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w100),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.calendar_month),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              child: Card(
                color: Colors.black87,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.library_books,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Notification!",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Now is the time to read the book,]n you can change it in the settings,",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.info,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return DateCard();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tuesday habit",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return HabitCard(
                    icon: categories[index][0],
                    title: categories[index][1],
                  );
                },
                itemCount: 6,
              ),
            )
          ],
        ),
      )),
    );
  }
}
