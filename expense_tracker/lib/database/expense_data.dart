import 'package:expense_tracker/dateTime/convertTimeToString.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> overallExpense = [];

  //get expense list
  List<ExpenseItem> getExpenseList() {
    return overallExpense;
  }

  //add expense list
  void addExpenseList(ExpenseItem item) {
    overallExpense.add(item);
    notifyListeners();
  }

  void removeItem(ExpenseItem item) {
    overallExpense.remove(item);
    notifyListeners();
  }

  // we need to know which week was the startDay or sunday
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  //to get the start of the week
  DateTime getStartWeek() {
    DateTime? startOfTheWeek;

    DateTime today = DateTime.now();

    for (int i = 0; i <= 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfTheWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfTheWeek!;
  }

  //trying to create a map to add the total list in a days
  Map<String, dynamic> dailyExpenseAdder() {
    Map<String, dynamic> dailyExpense = {};

    for (var expense in overallExpense) {
      var date = converDateTOString(expense.dateTime);
      double amount = expense.amount;

      if (dailyExpense.containsKey(date)) {
        var currentAmount = dailyExpense[date];
        currentAmount = currentAmount + amount;
        dailyExpense[date] = currentAmount;
      }
    }

    return dailyExpense;
  }
}
