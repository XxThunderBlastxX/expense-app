import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactionModel.dart';

class TransactionList extends StatelessWidget {
  //Variables
  final List<TransactionModel> transactions;

  //Constructor
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(transactions[index].date as DateTime),
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length),
    );
  }
}
