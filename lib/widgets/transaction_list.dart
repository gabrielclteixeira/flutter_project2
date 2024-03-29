import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTx;

  TransactionList(this.transactions, this.removeTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 310,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text('No transactions added yet'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 250,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ),
                      title: Text(transactions[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              icon: Icon(Icons.edit),
                              color: Theme.of(context).primaryColor,
                              onPressed: () => null,
                          ),
                          IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).primaryColor,
                              onPressed: () => removeTx(transactions[index].id),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
