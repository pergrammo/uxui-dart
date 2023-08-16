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
  Future<void> delayTime() async {
    await Future.delayed(const Duration(seconds: 3), () {
      print('Hello');
    });
    Future.delayed(const Duration(seconds: 2), () {
      print('Bye');
    });
  }

  @override
  void initState() {
    super.initState();
    delayTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
