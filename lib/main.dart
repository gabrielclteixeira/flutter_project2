import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Transactions App',
        home: MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.amber,
          fontFamily: 'OpenSans',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 'T1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
    // Transaction(
    //     id: 'T2', title: 'New Watch', amount: 149.99, date: DateTime.now()),
    // Transaction(
    //     id: 'Te', title: 'Groceries', amount: 100.99, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime choseDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: choseDate,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  void _openNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => _openNewTransaction(context),
              icon: Icon(Icons.add))
        ],
        title: Text('Transactions App'),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(_userTransactions, _deleteTransaction)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openNewTransaction(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
