import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 'T1', title: 'New Shoes', amount: 69.69, date: DateTime.now()),
    Transaction(id: 'T2', title: 'New Watch', amount: 149.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                child: Text('Chart'),
                color: Colors.orange,
              ),
              elevation: 5,
            ),
            Column(children: transactions.map((tx) => Card(
            color: Color.fromARGB(132, 76, 175, 79),
            child:Row(
              children: <Widget>[
                Container(
                  width: 90,
                color: Color.fromARGB(57, 244, 67, 54),
                padding: EdgeInsets.all(15),
                child: Text('${tx.amount.toString()}€',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                )
                ),

                Card(elevation: 10 ,child: Column(children: <Widget>[
                TextField(),
                TextField(),
                ],)
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(tx.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text(DateFormat('d/MMM/y @').add_jm().format(tx.date),style: TextStyle(color: Colors.white),),
                ],)
              ],
            )
            )
            ).toList())
          ]),
    );
  }
}
