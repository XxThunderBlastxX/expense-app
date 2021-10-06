import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transactionModel.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  //Variables
  final List<TransactionModel> _userTransactions = [
    TransactionModel(
        id: 't1', title: 'Shoe', amount: 43.87, date: DateTime.now()),
    TransactionModel(
        id: 't2', title: 'Books', amount: 20.87, date: DateTime.now()),
  ];

  //Functions
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = TransactionModel(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
