import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/_user_transactions.dart';
import 'models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        // appBarTheme: AppBarTheme(textTheme: TextTheme(headline1: TextStyle(fontFamily: 'OpenSans'))),

      ),
      home: const MyHomePage(title: 'Personal Expense'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _UserTransactions = [];

  void _displayNewTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Builder(builder: (context) {
            return GestureDetector(
              child: NewTransaction(addTransaction),
              onTap: () {},
              behavior: HitTestBehavior.opaque,
            );
          });
        });
  }

  void addTransaction({required Transaction transcation}) {
    setState(() {
      _UserTransactions.add(transcation);
    });
  }

  void deletTransaction(Transaction transaction) {
    setState(() {
      _UserTransactions.remove(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionList(
              transactions: _UserTransactions,
              deletTransaction: deletTransaction,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayNewTransactionForm(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
