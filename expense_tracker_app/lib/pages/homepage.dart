import 'package:expense_tracker_app/components/expense_summary.dart';
import 'package:expense_tracker_app/components/item_tile.dart';
import 'package:expense_tracker_app/database/expense_data.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController itemName = TextEditingController();

  TextEditingController price = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void save(context) {
    ExpenseItem item = ExpenseItem(
      name: itemName.text,
      amount: double.parse(price.text),
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context, listen: false).addExpenseList(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add New Expense"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: itemName),
                    TextField(controller: price),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      save(context);
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Consumer<ExpenseData>(
        builder: (context, value, child) {
          return Column(
            children: [
              SizedBox(height: 40),
              ExpenseSummary(startOfTheWeek: value.getStartWeek()),
              Expanded(
                child: ListView.builder(
                  itemCount: value.getExpenseList().length,
                  itemBuilder: (context, index) {
                    return ItemTile(
                      dateTime: value.overallExpense[index].dateTime,
                      itemName: value.overallExpense[index].name,
                      price: value.overallExpense[index].amount,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
