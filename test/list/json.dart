import 'dart:convert';
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
  String myJson() {
    var msg = {};
    msg["id"] = "012";
    msg["name"] = "Pergrammo";
    msg["surname"] = "Redcyber";
    var json = jsonEncode(msg);
    //print(json);
    return json;
  }

  Widget showMessage() {
    var receive = jsonDecode(myJson());
    return Card(
      child: ListTile(
        leading: Text(receive["id"]),
        title: Text(
          receive["name"],
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(receive["surname"]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showMessage(),
    );
  }
}
