import 'package:flutter/material.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/pages/Add%20Habit/habit_detail_page.dart';
import 'package:habit_now/utils/categories.dart';

class EditPage extends StatefulWidget {
  Habit? hb;
  EditPage({super.key, required this.hb});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController ed;

  @override
  void initState() {
    // TODO: implement initState
    ed = TextEditingController(text: widget.hb!.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Check Spending", style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.money),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: TextField(controller: ed),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              widget.hb!.title = ed.text;
                              Navigator.of(context).pop();
                            },
                            child: Text("Save"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 10),
                    Text("Habit name"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text("Select A category"),
                            content: SizedBox(
                              width: 200,
                              height: 300,
                              child: GridView.builder(
                                itemCount: 5,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                    ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap:
                                        () => {
                                          setState(() {
                                            widget.hb!.category =
                                                categories[index]['name'];
                                          }),

                                          Navigator.of(context).pop(),
                                        },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white10,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.all(10),

                                            child: Icon(
                                              categories[index]['icon'],
                                              color: categories[index]['color'],
                                            ),
                                          ),
                                          Text(
                                            categories[index]['name'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.category),
                        SizedBox(width: 10),
                        Text("Category"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(widget.hb!.category),
                      SizedBox(width: 10),
                      Icon(Icons.money),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
