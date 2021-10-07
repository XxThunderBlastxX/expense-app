import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //Variables
  final Function addTx;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  //Constructor
  NewTransaction(this.addTx);

  //Functions
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
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
