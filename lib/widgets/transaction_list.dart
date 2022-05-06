import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>
      transactions; /*= [
    Transaction(
        id: 'T1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'New Watch', amount: 149.99, date: DateTime.now()),
    Transaction(
        id: 'Te', title: 'Groceries', amount: 100.99, date: DateTime.now()),
  ];*/
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions
            .map((tx) => Card(
                color: Color.fromARGB(255, 76, 175, 79),
                child: Row(
                  children: <Widget>[
                    Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                        //decoration: Box,

                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                  width: 8,
                                  style: BorderStyle.solid)),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            '${tx.amount.toString()}€',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: tx.amount > 100
                                    ? Colors.orangeAccent
                                    : Color.fromARGB(255, 76, 175, 79)),
                          ),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            tx.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            DateFormat('d/MMM/y @').add_jm().format(tx.date),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                )))
            .toList());
  }
}
