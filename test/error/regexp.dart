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
  var myInput = TextEditingController();
  bool chked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showTextField(),
              showButton(),
              chked
                  ? const Text('Right')
                  : const Text('Please check input again!!'),
            ],
          ),
        ),
      ),
    );
  }

  Widget showTextField() {
    return TextField(
      controller: myInput,
    );
  }

  Widget showButton() {
    return ElevatedButton(
      onPressed: () {
        RegExp exp = RegExp(r"[a-zA-Z]{2}[-][\d]+");
        if (exp.hasMatch(myInput.text)) {
          setState(() {
            chked = true;
          });
        } else {
          chked = false;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      child: const Padding(padding: EdgeInsets.all(10), child: Text('Login')),
    );
  }
}
