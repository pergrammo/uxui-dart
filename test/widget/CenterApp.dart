import 'package:flutter/material.dart';

class CenterApp extends StatefulWidget {
  const CenterApp({super.key});

  @override
  State<CenterApp> createState() => _CenterAppState();
}

class _CenterAppState extends State<CenterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/00_hv_point_logo/Full/Group_826.png")
            ],
          ),
        ],
      ),
    );
  }
}
