import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      // get the date of the day.
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmountSum = 0.0;
      // group the data by date and get the total amount of money.
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmountSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalAmountSum};
    }).reversed.toList();
  }

  double get maxTotalSum {
    return recentTransactions.fold(
        0.0, (sum, element) => sum + element.amount );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: groupedTransactions.map((dayTransaction) {
            return Container(
                padding: EdgeInsets.all(5.0),
                child: ChartBar(
                  label: dayTransaction['day'],
                  amount: dayTransaction['amount'],
                  spendingOfWeekPre: maxTotalSum == 0 ? 0.0 : dayTransaction['amount'] / maxTotalSum,
                ));
          }).toList(),
        ));
  }
}
