import 'package:flutter/material.dart';
import '../models/transaction.dart';

class NewTransaction extends StatelessWidget {

  final Function addTx;
  var titleInputController = TextEditingController();
  var amountInputController = TextEditingController();
  
  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleInputController,),
            TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountInputController,),
            TextButton(
              onPressed: () {
                addTx(transcation:Transaction(
                  id: titleInputController.text,
                  title: titleInputController.text,
                  amount: double.parse(amountInputController.text), 
                  date: DateTime.now()));
              },
              child: Text('Add Transaction', style: TextStyle(color: Colors.deepPurpleAccent),))
          ],
        ),
      ),
    );
  }
}