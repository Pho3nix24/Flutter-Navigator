import 'package:flutter/material.dart';
import 'package:flutternavigaton/Pages/Books.dart';
import 'package:flutternavigaton/Pages/Employee.dart';
import 'package:flutternavigaton/Pages/Product.dart';
import 'package:flutternavigaton/Pages/student.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages=[Student(),Books(),Employee(),Product()];
  int _Myindex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[_Myindex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: _Myindex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  title: Text("Student"),
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  title: Text("Books"),
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text("Employee"),
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  title: Text("Product"),
                  backgroundColor: Colors.lightGreen),
            ],
            onTap: (index) {
              setState(() {
                _Myindex = index;
              });
            }),
      ),
    );
  }
}
