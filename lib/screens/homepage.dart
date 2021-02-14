import 'package:expensr/screens/add_expense.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  customScrollable() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("My Expenses",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                )),
            background: Container(
              color: Colors.blueAccent,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '\$ 2334',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 54.0,
                    ),
                  ),
                ],
              ),
            ),
            // Image.network(
            //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text("List Item $index"),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customScrollable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddExpense.routeName);
        },
        tooltip: "Add Expense",
        child: new Icon(Icons.add),
      ),
    );
  }
}
