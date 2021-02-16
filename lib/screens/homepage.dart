import 'dart:convert';

import 'package:expensr/models/user.dart';
import 'package:expensr/screens/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  customScrollable(int count,data) {
    print("custom count->>"+ count.toString());
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
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
          delegate: SliverChildListDelegate(_jobsListView(data)
          // delegate: SliverChildBuilderDelegate(context,index) => _jobsListView(data)


            // (context, index) => ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            //   trailing: Text("\$ 200",style: TextStyle(color: Colors.green),),
            //   title: Text("Lunch at Big Square $index"),
            //   subtitle: Text("Food",style: TextStyle(color:Colors.grey),),
            // ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customScrollable(30,6),
      // body: FutureBuilder<List<User>>(
      //         future: _fetchJobs(),
      //         builder: (context, snapshot) {
      //           if (snapshot.hasData) {
      //             List<User> data = snapshot.data;
      //             // return _jobsListView(data);
      //             return customScrollable(data.length,data);
      //           } else if (snapshot.hasError) {
      //             return Text("${snapshot.error}");
      //           }
      //           return Center(child: CircularProgressIndicator());
      //         },
      //       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddExpense.routeName);
        },
        tooltip: "Add Expense",
        child: new Icon(Icons.add),
      ),
    );
  }

  Future<List<User>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(jobsListAPIUrl);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new User.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  List _buildList(int count,dynamic data) {
    List<Widget> listItems = List();



    for (int i = 0; i < count; i++) {
      print("item->"+i.toString()+"\t data->>"+data[i]);
      listItems.add(ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            trailing: Text("\$ 200",style: TextStyle(color: Colors.green),),
            title: Text("list item $i"),
            subtitle: Text("Food",style: TextStyle(color:Colors.grey),),
          ));
    }

    return listItems;
  }

  _jobsListView(data) {
    return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _tile(data[index].name, data[index].username, Icons.work);
    });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );


}
