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
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                          tx.title.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
          ],
        ));
  }
}
