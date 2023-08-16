import 'package:flutter/material.dart';

class PaddingApp extends StatefulWidget {
  const PaddingApp({super.key});

  @override
  State<PaddingApp> createState() => _PaddingAppState();
}

class _PaddingAppState extends State<PaddingApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Text('Lorem ipsum dolor sit amet',
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                      'consectetur adipiscing elit. Morbi scelerisque dapibus neque auctor sodales.'),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 20, 0),
                child: Text('Maecenas dignissim'),
              ),
              Text('Nunc eu fermentum purus'),
            ],
          ),
        ],
      ),
    );
  }
}
