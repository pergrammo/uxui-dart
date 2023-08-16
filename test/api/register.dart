import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  var nameCtrl = TextEditingController();
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  Future<void> _regist() async {
    var myReq = {};
    myReq['fname'] = nameCtrl.text;
    myReq['email'] = usernameCtrl.text;
    myReq['pass'] = passwordCtrl.text;
    String jsonReq = jsonEncode(myReq);
    var response = await http.post(
        Uri.parse(
            'https://healthverse.world/serverapi/set_updatemanageuser.php'),
        body: jsonReq,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    if (response.statusCode == 200) {
      var msg = jsonDecode(response.body);
      print(msg);
      if (msg['status'] == "Success") {
        print('Register success');
        Navigator.pop(context);
      } else {
        print('Error');
      }
    }
  }

  Widget showName() {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: nameCtrl,
      decoration: const InputDecoration(
        labelText: 'Name',
        icon: Icon(Icons.mood),
      ),
    );
  }

  Widget showUsername() {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: usernameCtrl,
      decoration: const InputDecoration(
        labelText: 'Username',
        icon: Icon(Icons.person),
      ),
    );
  }

  Widget showPassword() {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: passwordCtrl,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.vpn_key),
      ),
    );
  }

  Widget showSubmit() {
    return ElevatedButton(
      onPressed: () {
        _regist();
      },
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 17,
        ),
      ),
      child: const Text('Submit'),
    );
  }

  Widget showCancel() {
    return ElevatedButton(
      onPressed: () {
        print('cancel');
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
      ),
      child: const Text('Cancel'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: <Widget>[
            showName(),
            showUsername(),
            showPassword(),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                showSubmit(),
                const Padding(padding: EdgeInsets.all(10)),
                showCancel(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
