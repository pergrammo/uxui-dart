import 'package:flutter/material.dart';
import 'package:hvpoint/screen/login_view.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../shared/bgimage_shared.dart';
import '../shared/titlebar_shared.dart';
import '../screen/profile_view.dart';

class ConfirmOtpView extends StatefulWidget {
  const ConfirmOtpView({super.key});

  @override
  State<ConfirmOtpView> createState() => _ConfirmOtpViewState();
}

class _ConfirmOtpViewState extends State<ConfirmOtpView> {
  OtpFieldController otpController = OtpFieldController();
  var bgimageshared = BgImageShared();
  var titlebarshared = TitleBarShared();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: bgimageshared.CfbgImage(),
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
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const LoginView(),
                  ));
            },
          ),
          title: titlebarshared.titleBar('ยืนยัน OTP'),
          foregroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.transparent,
              ),
              //tooltip: 'Settings',
              onPressed: () {},
            ),
          ],
          //actions: <Widget>[],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                txtOtp(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: txtOtpField(),
                ),
                txtEpOtp(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                txtRenewOtp(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
                btnOtpConfirm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtOtp() {
    return Column(
      children: const <Widget>[
        Text(
          'ใส่รหัส OTP 4 หลัก',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Padding(padding: EdgeInsets.all(2)),
        Text(
          'SMS ส่งไปยังเบอร์ xxx-xxx-9999',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget txtEpOtp() {
    return const Text(
      'รหัสอ้างอิง: จะหมดอายุภายใน 5 นาที',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }

  Widget txtRenewOtp() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'ขอรหัส OTP ใหม่',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget txtOtpField() {
    return OTPTextField(
        controller: otpController,
        length: 4,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceEvenly,
        fieldWidth: 45,
        fieldStyle: FieldStyle.box,
        outlineBorderRadius: 15,
        style: const TextStyle(fontSize: 17),
        onChanged: (pin) {
          print("Changed: " + pin);
        },
        onCompleted: (pin) {
          print("Completed: " + pin);
        });
  }

  Widget btnOtpConfirm() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const ProfileView(),
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
      child: const Padding(padding: EdgeInsets.all(10), child: Text('ยืนยัน')),
    );
  }
}
