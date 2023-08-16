import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import '../test/restapi/dataModel2.dart';
import 'dataModel2.dart';

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
  Future<String?> _getList() async {
    String url = 'https://reqres.in/api/users?page=2';

    var response = await http.get(Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Widget showList() {
    return FutureBuilder(
      future: _getList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> myList;
        if (snapshot.hasData) {
          //print('data: ${snapshot.data.runtimeType}');
          var myData = jsonDecode(snapshot.data);
          print(jsonEncode(myData["data"]));
          List<DataModel2> lists =
              dataModel2FromJson(jsonEncode(myData["data"]));
          myList = <Widget>[
            Column(
              children: lists.map((myList) {
                return Card(
                  child: ListTile(
                    title:
                        Text(myList.firstName), //Text('${myList.firstName}'),
                    subtitle: Text(myList.email),
                    leading: Image.network(myList.avatar),
                  ),
                );
              }).toList(),
            ),
          ];
        } else if (snapshot.hasError) {
          myList = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ),
          ];
        } else {
          myList = <Widget>[
            const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Processing...'),
            ),
          ];
        }
        return Center(
          child: Column(
            children: myList,
          ),
        );
      },
    );
  }

  Widget showButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 17,
        ),
      ),
      child: const Text('Show Feed'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView(
        children: <Widget>[
          showButton(),
          showList(),
        ],
      ),
    );
  }
}
