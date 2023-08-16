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
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  Future<void> login() async {
    //String url = 'https://reqres.in/api/login';

    var myReq = {};
    myReq['email'] = username.text;
    myReq['password'] = password.text;
    String jsonReq = jsonEncode(myReq);
    var response = await http.post(
        Uri(
          scheme: 'https',
          host: 'reqres.in',
          path: 'api/login',
          //fragment: 'numbers'
        ),
        body: jsonReq,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(res['token']);
    } else {
      print(res['error']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'asset/images/logo.png',
                width: 100,
              ),
              const Text(
                'Family Account',
                style: TextStyle(fontSize: 24),
              ),
              const Text(
                'CMS for Family Account',
                style: TextStyle(fontSize: 12),
              ),
              const Text(
                'University of Ubon Ratchathani',
                style: TextStyle(fontSize: 12),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: username,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.vpn_key),
                ),
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                controller: password,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                      ),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
