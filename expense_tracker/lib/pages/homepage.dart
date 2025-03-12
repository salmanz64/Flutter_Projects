import 'package:expense_tracker/components/item_tile.dart';
import 'package:expense_tracker/database/expense_data.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  TextEditingController itemName = TextEditingController();
  TextEditingController price = TextEditingController();

  void save(context) {
    ExpenseItem item = ExpenseItem(
        name: itemName.text,
        amount: double.parse(price.text),
        dateTime: DateTime.now());
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
                    TextField(
                      controller: itemName,
                    ),
                    TextField(
                      controller: price,
                    )
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        save(context);
                      },
                      child: Text("Save"))
                ],
              );
            },
          );
        },
      ),
      body: Consumer<ExpenseData>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.getExpenseList().length,
            itemBuilder: (context, index) {
              return ItemTile(
                  dateTime: value.overallExpense[index].dateTime,
                  itemName: value.overallExpense[index].name,
                  price: value.overallExpense[index].amount);
            },
          );
        },
      ),
    );
  }
}
