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
  final _formKey = GlobalKey<FormState>();
  String messages = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: 200,
            child: Column(
              children: <Widget>[
                showUsername(),
                showPassword(),
                showButton(),
                (messages == "") ? Container() : Text(messages)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showUsername() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Username',
          prefixIcon: Icon(
            Icons.account_box,
            color: Colors.cyan,
          ),
          border: OutlineInputBorder(),
          hintText: 'Input Username',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please insert Username';
          }
          return null;
        },
      ),
    );
  }

  Widget showPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.green,
          ),
          border: OutlineInputBorder(),
          hintText: 'Input Password',
        ),
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please insert Password';
          }
          return null;
        },
      ),
    );
  }

  Widget showButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            messages = 'Processing';
          });
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
