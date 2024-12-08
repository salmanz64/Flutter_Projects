import 'package:flutter/material.dart';
import 'package:todo_app/components/add_tasks.dart';
import 'package:todo_app/components/category_card.dart';
import 'package:todo_app/components/todo_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF3F7FE),
      drawer: const Drawer(
        elevation: 20,
        backgroundColor: Color(0XFF0E1F54),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.circle,
                    size: 150,
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Joy \n Mitchell",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.bookmark_border,
                  size: 30,
                ),
                title: Text(
                  "Templates",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.category,
                  size: 30,
                ),
                title: Text(
                  "Categories",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.analytics,
                  size: 30,
                ),
                title: Text(
                  "Analytics",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
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
        shape: const CircleBorder(),
        onPressed: () {
          showDialog(context: context, builder: (context) => AddTasks());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
