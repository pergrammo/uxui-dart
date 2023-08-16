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
  List<String> myList = ['User1', 'User2', 'User3'];

  /*
  Widget showText() {
    String txt = '';
    for (var value in myList) {
      txt = txt + value + '\n';
    }
    return Text(txt);
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: showText(),
      body: Column(
        children: myList.map((val) {
          return Text(val);
        }).toList(),
      ),
    );
  }
}
