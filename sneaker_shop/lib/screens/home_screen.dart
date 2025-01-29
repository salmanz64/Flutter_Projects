import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Icon(
          Icons.menu,
          size: 40,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              "Everyone Flies...some flies longer than Others.",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hot Picks 🔥",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 120,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset('lib/assets/shoes/shoes_1.png'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Bouncy coush is paired with soft yet and supporting foam for responsiveness and smooth heel-to-toe transition",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kyrie 6",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "\$120",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: GNav(
            color: Colors.grey[400],
            mainAxisAlignment: MainAxisAlignment.center,
            tabBackgroundColor: Colors.white,
            activeColor: Colors.grey.shade700,
            tabBorderRadius: 16,
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.shopping_cart, text: 'Cart'),
            ]),
      ),
    );
  }
}
