import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
            margin: EdgeInsets.all(10),
            elevation: 10,
            child: TextField(
              // onChanged: ((value) => titleInput = value),
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            )),
        Card(
            margin: EdgeInsets.all(10),
            elevation: 10,
            child: TextField(
              // onChanged: ((value) => amountInput = value),
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            )),
        Card(
            child: FlatButton(
                onPressed: (() => ''),
                textColor: Colors.green,
                child: Text('Add Transaction'))),
      ],
    );
  }
}
