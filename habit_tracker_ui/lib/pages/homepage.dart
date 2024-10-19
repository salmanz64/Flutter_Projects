import 'package:flutter/material.dart';
import 'package:habit_tracker_ui/components/dateCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
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
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
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
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return DateCard();
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
