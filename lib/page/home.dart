import 'package:coffee/navigation.dart';
import 'package:coffee/page/cart.dart';
import 'package:coffee/page/first.dart';
import 'package:coffee/page/list.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color c = Color.fromRGBO(56, 34, 8, 1);
  int sel = 0;
  void navbar(int index) {
    setState(() {
      sel = index;
    });
  }

  // List<coffee> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> page = [first(), list(), cart()];
    return Scaffold(
      backgroundColor: c,
      bottomNavigationBar: nav(onTabChange: (i) => navbar(i)),
      body: page[sel],
    );
  }
}
