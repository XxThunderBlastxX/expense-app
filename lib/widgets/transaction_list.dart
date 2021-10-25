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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions have been added yet !!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 30),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
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
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
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
                            style: Theme.of(context).textTheme.headline6,
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
