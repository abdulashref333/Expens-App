import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({ Key? key }) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // final List<Transaction> _UserTransactions = [];

  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return  Column(
          children: <Widget>[
            // TransactionList(transactions: _UserTransactions, deletTransaction: deletTransaction,),
          ]
    );
  }

  

}