import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;

  void submitData() {
    if (amountController.text.isEmpty || titleController.text.isEmpty) return;
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
              margin: EdgeInsets.only(left: 10),
              child: TextField(
                // onChanged: ((value) => titleInput = value),
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => submitData(),
              )),
          Card(
              margin: EdgeInsets.only(left: 10),
              child: TextField(
                // onChanged: ((value) => amountInput = value),
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              )),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Chosen Date: ${DateFormat('dd MMM yyyy').format(_selectedDate)}')),
                FlatButton(
                    onPressed: () {
                      _presentDatePicker();
                    },
                    child: Text('Choose Date!',
                        style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            ),
          ),
          RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: submitData,
              color: Theme.of(context).primaryColor,
              child: Text('Add Transaction')),
        ],
      ),
    );
  }
}
