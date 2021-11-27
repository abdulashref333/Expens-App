import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Function deletTransaction;
  final List<Transaction> transactions;
  const TransactionList({ Key? key , required this.transactions, required this.deletTransaction}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: transactions.map((transaction) {
            return Card(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  decoration: BoxDecoration(border: Border.all(color: Colors.deepPurpleAccent)),
                  child: Text('\$${transaction.amount}', style: const TextStyle(color: Colors.deepPurpleAccent),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transaction.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text(DateFormat().format(transaction.date), style: const TextStyle(color: Colors.grey), )
                  ],
              ),
              IconButton(onPressed: () => deletTransaction(transaction), icon: const Icon(Icons.delete , color: Colors.red,))
            ],));
          }).toList(),
        );
  }
}