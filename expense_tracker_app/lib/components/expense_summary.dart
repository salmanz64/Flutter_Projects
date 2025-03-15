import 'package:expense_tracker_app/bar%20graph/mybar_graph.dart';
import 'package:expense_tracker_app/database/expense_data.dart';
import 'package:expense_tracker_app/dateTime/convertTimeToString.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfTheWeek;
  ExpenseSummary({super.key, required this.startOfTheWeek});

  @override
  Widget build(BuildContext context) {
    String sunday = converDateTOString(
      startOfTheWeek.add(const Duration(days: 0)),
    );
    String monday = converDateTOString(
      startOfTheWeek.add(const Duration(days: 1)),
    );
    String tueday = converDateTOString(
      startOfTheWeek.add(const Duration(days: 2)),
    );
    String wedneday = converDateTOString(
      startOfTheWeek.add(const Duration(days: 3)),
    );
    String thur = converDateTOString(
      startOfTheWeek.add(const Duration(days: 4)),
    );
    String fri = converDateTOString(
      startOfTheWeek.add(const Duration(days: 5)),
    );
    String sat = converDateTOString(
      startOfTheWeek.add(const Duration(days: 6)),
    );
    return Consumer<ExpenseData>(
      builder: (context, value, child) {
        return SizedBox(
          height: 200,
          child: MybarGraph(
            maxY: 100,
            sunAmount: value.dailyExpenseAdder()[sunday] ?? 0,
            monAmount: value.dailyExpenseAdder()[monday] ?? 0,
            tueAmount: value.dailyExpenseAdder()[tueday] ?? 0,
            wedAmount: value.dailyExpenseAdder()[wedneday] ?? 0,
            thurAmount: value.dailyExpenseAdder()[thur] ?? 0,
            friAmount: value.dailyExpenseAdder()[fri] ?? 0,
            satAmount: value.dailyExpenseAdder()[sat] ?? 0,
          ),
        );
      },
    );
  }
}
