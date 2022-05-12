import 'package:flutter/material.dart';
import './user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
              margin: EdgeInsets.only(left:10),
              child: TextField(
                // onChanged: ((value) => titleInput = value),
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => submitData(),
              )),
          Card(
              margin: EdgeInsets.only(left:10),
              child: TextField(
                // onChanged: ((value) => amountInput = value),
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              )),
          FlatButton(
              onPressed: submitData,
              textColor: Colors.green,
              child: Text('Add Transaction')),
        ],
      ),
    );
  }
}
