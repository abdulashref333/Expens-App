import 'package:flutter/material.dart';
import '../models/transaction.dart';

// ignore: must_be_immutable
class NewTransaction extends StatelessWidget {

  final Function addTx;
  var titleInputController = TextEditingController();
  var amountInputController = TextEditingController();
  
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: const InputDecoration(labelText: 'Title'), controller: titleInputController,),
            TextField(decoration: const InputDecoration(labelText: 'Amount'), controller: amountInputController,),
            TextButton(
              onPressed: () {
                addTx(transcation:Transaction(
                  id: titleInputController.text,
                  title: titleInputController.text,
                  amount: double.parse(amountInputController.text), 
                  date: DateTime.now()));
              },
              child: const Text('Add Transaction', style: TextStyle(color: Colors.deepPurpleAccent),))
          ],
        ),
      ),
    );
  }
}