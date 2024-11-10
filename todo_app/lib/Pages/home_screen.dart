import 'package:flutter/material.dart';
import 'package:todo_app/components/category_card.dart';
import 'package:todo_app/components/todo_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF3F7FE),
      drawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0XFFF3F7FE),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30,
            color: const Color(0XFF99A4C3),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            iconSize: 30,
            color: const Color(0XFF99A4C3),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What's Up, Joy!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "CATEGORIES",
                style: TextStyle(color: Color(0XFF99A4C3)),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 130,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return const CategoryCard();
                    },
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "TODAY'S TASKS",
                style: TextStyle(
                    color: Color(0XFF99A4C3),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const TodoCards();
                },
                itemCount: 6,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
