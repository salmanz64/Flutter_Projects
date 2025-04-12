import 'package:expense_tracker_app/model/expense.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  final box = Hive.box('expense_database');

  void addData(List<ExpenseItem> allItems) {
    /* we need to convert the object class expense item to readable hive data as 
      String and data time as it is the datatypes it accepts in hive.
      
      So we need to convert 
      [
      ...
      ExpenseItem(
        item,
        amount,
        date
      )
      .....
      ]


      =>
      
      [
      ....
      [name,amount,date]
      ...
      ]

    */

    List<List<dynamic>> formattedList = [];
    for (var items in allItems) {
      List<dynamic> singleList = [items.name, items.amount, items.dateTime];
      formattedList.add(singleList);
    }
    box.put('AllExpenseLists', formattedList);
  }

  List<ExpenseItem> readDate() {
    //to convert the data stored in hive to the object class
    var convertedList = box.get('AllExpenseLists') ?? [];

    List<ExpenseItem> originalList = [];

    for (int i = 0; i < convertedList.length; i++) {
      String itemName = convertedList[i][0]; 
      double amount = convertedList[i][1];
      DateTime date = convertedList[i][2]; 

      originalList.add(
        ExpenseItem(name: itemName, amount: amount, dateTime: date),
      );
    }
    return originalList;
  }
}
