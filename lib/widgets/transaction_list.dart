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
      height: MediaQuery.of(context).size.height * 0.57,
      alignment: Alignment.center,
      child: transactions.isEmpty ? Column(
        children: [
          SizedBox(height: 10.0,),
          Text('No Transactions Added Yet!', style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(height: 10.0,),
          Container(
            height: 250.0,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
          ),
        ],
      ): ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(0,0,0,10),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 70,
                    margin: EdgeInsets.all(5.0),
                    padding:  EdgeInsets.all(15),
                    decoration: BoxDecoration(border: Border.all(color: Colors.deepPurpleAccent),
                    shape: BoxShape.circle),
                    child: FittedBox(fit: BoxFit.cover, child: Text('\$${transactions[index].amount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.deepPurpleAccent),)),
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
            ),
          );
        },
        itemCount: transactions.length,
      )
    );
  }
}