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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showText(),
      ),
    );
  }

  Widget showText() {
    int x = 12;
    int y = 0;
    String txt;
    try {
      int res = x ~/ y;
      txt = "result : $res";
    } catch (e) {
      txt = e.toString();
    }
    return Text(txt);
  }
}
