import 'package:flutter/material.dart';
import '../models/transaction.dart';

// ignore: must_be_immutable
class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var titleInputController = TextEditingController();

  var amountInputController = TextEditingController();

  void addNewTransaction() {
    // print('i was called....hahah.');
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(
        amountInputController.text.isEmpty ? '0' : amountInputController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
        transcation: Transaction(
            id: enteredTitle + ":" + DateTime.now().toString(),
            title: enteredTitle,
            amount: enteredAmount,
            date: DateTime.now()));

    Navigator.pop(context);
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
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ))
          ],
        ),
      ),
    );
  }
}
