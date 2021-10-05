import 'package:flutter/material.dart';

import './transactionModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //Variables
  final List<TransactionModel> transactions = [
    TransactionModel(
        id: 't1', title: 'Shoe', amount: 43.87, date: DateTime.now()),
    TransactionModel(
        id: 't2', title: 'Books', amount: 20.87, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: [
            Card(
              child: Text("Chart"),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(child: Text(tx.title.toString()));
              }).toList(),
            ),
          ],
        ));
  }
}
