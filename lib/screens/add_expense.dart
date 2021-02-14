import 'package:expensr/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  static const routeName = '/add-expense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  final _expense = Expense();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
        child: Form(
            key: _formKey,
            child: Column(
                children: <Widget>[
                  // Add TextFormFields and ElevatedButton here.
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your title of your expense.';
                      }
                    },
                    onSaved: (val) => setState(() => _expense.title = val),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the amount of your expense.';
                      }
                    },
                    onSaved: (val) => setState(() => _expense.amount = val),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Category'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the category of your expense.';
                      }
                    },
                    onSaved: (val) => setState(() => _expense.category = val),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Date of Expense'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the date of your expense.';
                      }
                    },
                    onSaved: (val) => setState(() => _expense.date = val),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          _expense.save();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text("Click",
                          style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
        ),
      ),
    );
  }
}
