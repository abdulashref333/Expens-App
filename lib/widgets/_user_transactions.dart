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
  
  // ignore: non_constant_identifier_names
  final List<Transaction> _UserTransactions = [];
  @override
  Widget build(BuildContext context) {
    return  Column(
          children: <Widget>[
            NewTransaction(addTransaction),
            TransactionList(transactions: _UserTransactions, deletTransaction: deletTransaction,),
          ]
    );
  }

  void deletTransaction(Transaction transaction){
    setState(() {
      _UserTransactions.remove(transaction);
    });
  }
  void addTransaction({required Transaction transcation}){
    setState(() {
      _UserTransactions.add(transcation);
    });
  }

}