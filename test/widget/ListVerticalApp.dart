import 'package:flutter/material.dart';

class ListVerticalApp extends StatefulWidget {
  const ListVerticalApp({super.key});

  @override
  State<ListVerticalApp> createState() => _ListVerticalAppState();
}

class _ListVerticalAppState extends State<ListVerticalApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.orange,
          ),
          Container(
            height: 150,
            color: Colors.pink,
          ),
          Container(
            height: 150,
            color: Colors.yellow,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            color: Colors.blueGrey,
          ),
          Container(
            height: 150,
            color: Colors.lightBlue,
          ),
          Container(
            height: 150,
            color: Colors.orange,
          ),
          Container(
            height: 150,
            color: Colors.pink,
          ),
          Container(
            height: 150,
            color: Colors.yellow,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
