import 'package:flutter/material.dart';

class TitleBarShared {
  TitleBarShared() {/**/}

  Align titleBar(String txt) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Text(
          txt,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
