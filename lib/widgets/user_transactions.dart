import 'package:flutter/material.dart';
import '/widgets/transaction_list.dart';
import '/widgets/new_transaction.dart';
import '/models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'T1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'New Watch', amount: 149.99, date: DateTime.now()),
    Transaction(
        id: 'Te', title: 'Groceries', amount: 100.99, date: DateTime.now()),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions)
    ]);
  }
}
