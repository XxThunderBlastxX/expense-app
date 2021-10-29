import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //Variables
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //Variables
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime? _selectedDate;

  //Functions
  void _submitData() {
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

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
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
              onSubmitted: (_) => _submitData(),
              controller: titleController,
              // onChanged: (val) {
              //   this.titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => _submitData(),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal:
                      true), //withOptions given bcz to make decimal input available on iOS
            ),
            Container(
              height: 70,
              child: Row(children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "No Date Chosen!!"
                        : 'Date : ${DateFormat('yyyy-MM-dd').format(_selectedDate as DateTime).toString()}',
                  ),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                  child: Text("Choose Date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ]),
            ),
            ElevatedButton(
              onPressed: () {
                _submitData();
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
