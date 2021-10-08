import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //Variables
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData(),
              controller: titleController,
              // onChanged: (val) {
              //   this.titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => submitData(),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal:
                      true), //withOptions given bcz to make decimal input available on iOS
            ),
            ElevatedButton(
              onPressed: () {
                submitData();
              },
              child: Text(
                "Add Transaction",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
