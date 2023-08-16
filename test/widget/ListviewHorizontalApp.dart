import 'package:flutter/material.dart';

class ListviewHonrizontalApp extends StatefulWidget {
  const ListviewHonrizontalApp({super.key});

  @override
  State<ListviewHonrizontalApp> createState() => _ListviewHonrizontalAppState();
}

class _ListviewHonrizontalAppState extends State<ListviewHonrizontalApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 150,
                width: 110,
                color: Colors.brown,
              ),
              Container(
                height: 150,
                width: 110,
                color: Colors.deepOrange,
              ),
              Container(
                height: 150,
                width: 110,
                color: Colors.deepPurple,
              ),
              Container(
                height: 150,
                width: 110,
                color: Colors.lightGreenAccent,
              ),
              Container(
                height: 150,
                width: 110,
                color: Colors.brown,
              ),
              Container(
                height: 150,
                width: 110,
                color: Colors.deepOrange,
              ),
              Container(
                height: 150,
                width: 110,
                color: Colors.deepPurple,
              ),
              Container(
                height: 150,
                width: 110,
                color: Colors.lightGreenAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
