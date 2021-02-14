import 'dart:ui';

import 'package:expensr/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  static const routeName = '/add-expense';
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  final _expense = Expense();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('d-MM-yyyy');
  TextEditingController _datecontroller = new TextEditingController();
  int _value = 1;
  // DateTime selectedDate =  DateFormat("dd-MM-yyyy").format(DateTime.now());

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
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
            Container(
              padding: EdgeInsets.only(top:10.0),
              child: DropdownButton(
                  value: _value,style: TextStyle(color: Colors.cyan),
                  onChanged: (value){
                    setState(() {
                      _value = value;
                    });
                  },
                  items: [
                  DropdownMenuItem(child: Text("Category 1"),value: 1,),
                  DropdownMenuItem(child: Text("Category 2"),value: 2,),
                  DropdownMenuItem(child: Text("Category 3"),value: 3,),
                  DropdownMenuItem(child: Text("Category 4"),value: 4,),
                ],),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Date of Expense"),
            InkWell(
              onTap: () => _selectDate(context),
              child: IgnorePointer(
                child: TextField(
                  controller: _datecontroller,
                  decoration: InputDecoration(

                    hintText: ('${myFormat.format(selectedDate)}'),
                  ),

                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    _expense.save();
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
