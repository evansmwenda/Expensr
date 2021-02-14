import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  static const routeName = '/add-expense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
      ),
      body: Container(
        child: Form(
            key: _formKey,
            child: Column(
                children: <Widget>[
                  // Add TextFormFields and ElevatedButton here.
                ]
            )
        ),
      ),
    );
  }
}
