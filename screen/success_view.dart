import 'package:flutter/material.dart';
import '../shared/bgimage_shared.dart';
import '../shared/titlebar_shared.dart';
import '../screen/home_view.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  var bgimageshared = BgImageShared();
  var titlebarshared = TitleBarShared();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: bgimageshared.ScbgImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            tooltip: 'กลับ',
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              //Navigator.popUntil(context, ModalRoute.withName("/"));
              Navigator.pop(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const HomeView(),
                  ));
            },
          ),
          title: titlebarshared.titleBar(''),
          foregroundColor: Colors.black,
          //actions: <Widget>[],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                scImage(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                txtSuccess(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
                btnSuccess(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scImage() {
    return Image.asset(
      'images/05_profile/success.png',
      width: 120,
    );
  }

  Widget txtSuccess() {
    return Column(
      children: const <Widget>[
        Text(
          'สำเร็จ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget btnSuccess() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const HomeView(),
            ));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: const TextStyle(
          //backgroundColor: Colors.blue,
          color: Colors.white,
          fontSize: 17,
          //fontStyle: FontStyle.italic,
        ),
      ),
      child: const Padding(
          padding: EdgeInsets.all(10), child: Text('กลับหน้าหลัก')),
    );
  }
}
