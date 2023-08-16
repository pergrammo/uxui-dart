import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<theList> myList = [
    theList(text: 'Flutter Programming', author: 'egkarin'),
    theList(author: 'wajiraporn', text: 'Network Design'),
    theList(author: 'piyawat', text: 'Android Programming'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: showText(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: myList.map((val) {
          return Text('${val.text} - [${val.author}]');
        }).toList(),
      ),
    );
  }
}

class theList {
  String text;
  String author;
  theList({required this.text, required this.author});
}

/*
class theList {
  String text;
  String author;

  theList(String text, String author) {
    this.text = text;
    this.author = author;
  }
}
*/
