import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chartBar.dart';
import '../models/transactionModel.dart';

class Chart extends StatelessWidget {
  //Variables
  final List<TransactionModel> recentTransactions;

  //Constructor
  Chart(this.recentTransactions);

  //Functions
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (DateFormat('EEEE').format(recentTransactions[i].date!) ==
            DateFormat('EEEE').format(weekDay)) {
          totalSum += recentTransactions[i].amount;
        }
      }
      // print({
      //   "day": DateFormat.E().format(weekDay).substring(0, 3),
      //   "amount": totalSum
      // }.toString());
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 3),
        "amount": totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(recentTransactions[2].date);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map(
            (data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'].toString(),
                    (data['amount'] as double),
                    totalSpending == 0.0
                        ? 0.0
                        : ((data['amount'] as double) / totalSpending)),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

//${data['day']} : ${data['amount']}
