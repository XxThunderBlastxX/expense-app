import 'package:flutter/cupertino.dart';

class TransactionModel {
  //Variables
  String? id;
  String? title;
  double? amount;
  DateTime? date;

  //Constructor
  TransactionModel(
      {@required id,
      @required title,
      @required this.amount,
      @required this.date});
}
