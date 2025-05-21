import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/pages/Add%20Habit/habit_detail_page.dart';
import 'package:habit_now/utils/categories.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  Habit? hb;
  final void Function(Habit) onTap;
  EditPage({super.key, required this.hb, required this.onTap});

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
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            widget.hb!.title,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.money),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                              Provider.of<HabitData>(
                                context,
                                listen: false,
                              ).editHabitName(widget.hb!, ed.text);
                              widget.onTap(widget.hb!);
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
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
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
                                            Provider.of<HabitData>(
                                              context,
                                              listen: false,
                                            ).editHabitCategory(
                                              widget.hb!,
                                              categories[index]['name'],
                                            );
                                            widget.onTap(widget.hb!);
                                            Navigator.of(context).pop();
                                          }),
                                        },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.tertiary,
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
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
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
