import 'package:flutter/material.dart';
import '../models/transaction.dart';

// ignore: must_be_immutable
class NewTransaction extends StatelessWidget {

  final Function addTx;
  var titleInputController = TextEditingController();
  var amountInputController = TextEditingController();
  
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  void addNewTransaction(){
    // print('i was called....hahah.');
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text.isEmpty ? '0' : amountInputController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return ;
    }
    addTx(
      transcation:Transaction(
        id: enteredTitle + ":"+ DateTime.now().toString(),
        title: enteredTitle,
        amount: enteredAmount, 
        date: DateTime.now()
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'), 
              controller: titleInputController,
              onSubmitted: (val) => addNewTransaction(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'), 
              controller: amountInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (val) => addNewTransaction(),
            ),
            TextButton(
              onPressed: addNewTransaction,
              child: const Text('Add Transaction', style: TextStyle(color: Colors.deepPurpleAccent),))
          ],
        ),
      ),
    );
  }
}