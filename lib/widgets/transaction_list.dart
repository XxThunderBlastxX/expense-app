import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactionModel.dart';

class TransactionList extends StatelessWidget {
  //Variables
  final List<TransactionModel> transactions;
  final Function deleteTx;

  //Constructor
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  "No transactions have been added yet !!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 30),
                Container(
                  height: constrains.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(transactions[index].title.toString(),
                      style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(
                    DateFormat.yMMMd()
                        .format(transactions[index].date as DateTime),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? FlatButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          label: Text("Delete"),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length);
  }
}

// Card(
// child: Row(
// children: <Widget>[
// Container(
// child: Text(
// '\$ ${transactions[index].amount.toStringAsFixed(2)}',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: Theme.of(context).primaryColor,
// ),
// ),
// margin:
// EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// decoration: BoxDecoration(
// border: Border.all(
// color: Theme.of(context).primaryColor,
// width: 2,
// ),
// ),
// padding: EdgeInsets.all(10),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// transactions[index].title.toString(),
// style: Theme.of(context).textTheme.headline6,
// ),
// Text(
// DateFormat.yMMMd()
// .format(transactions[index].date as DateTime),
// style: TextStyle(color: Colors.grey, fontSize: 13),
// ),
// ],
// )
// ],
// ),
// );
