import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import '../shared/bgimage_shared.dart';
import '../screen/confirm_otp_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var bgimageshared = BgImageShared();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: bgimageshared.bgImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                hvImage(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 5)),
                txtPhone(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                inputPhone(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                btnLoginView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget hvImage() {
    return Image.asset(
      'images/00_hv_point_logo/Full/Group_826.png',
      width: 120,
    );
  }

  /*
  Widget hvImage() {
    return CachedNetworkImage(
      imageUrl:
          'https://point.healthverse.world/assets/images/00_hv_point_logo/Full/Group_826.png',
      placeholder: (BuildContext context, String url) => Container(
        width: 120,
        //height: 240,
        //color: Colors.purple,
      ),
    );
  }
  */

  Widget txtPhone() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: const Text(
          "เบอร์โทรศัพท์มือถือ",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget inputPhone() {
    return const TextField(
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        //hintText: 'เบอร์โทรศัพท์มือถือ',
      ),
      keyboardType: TextInputType.phone,
    );
  }

  Widget btnLoginView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const ConfirmOtpView(),
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
              padding: EdgeInsets.all(10),
              child: Text('เข้าสู่ระบบ/สมัครสมาชิก')),
        ),
      ],
    );
  }
}
