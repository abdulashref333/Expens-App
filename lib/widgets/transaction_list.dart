import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Function deletTransaction;
  final List<Transaction> transactions;
  const TransactionList({ Key? key , required this.transactions, required this.deletTransaction}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  decoration: BoxDecoration(border: Border.all(color: Colors.deepPurpleAccent)),
                  child: Text('\$${transactions[index].amount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.deepPurpleAccent),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text(DateFormat().format(transactions[index].date), style: const TextStyle(color: Colors.grey), )
                  ],
              ),
                IconButton(
                  onPressed: () => deletTransaction(transactions[index]),
                  icon: const Icon(Icons.delete , color: Colors.red,)
                )
              ]
            )
          );
        },
        itemCount: transactions.length,
      )
    );
  }
}