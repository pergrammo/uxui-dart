import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:hvpoint/screen/confirm_otp_view.dart';
import '../shared/bgimage_shared.dart';
import '../shared/titlebar_shared.dart';
import '../screen/home_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var bgimageshared = BgImageShared();
  var titlebarshared = TitleBarShared();

  bool _isSelected = false;

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
                    builder: (context) => const ConfirmOtpView(),
                  ));
            },
          ),
          title: titlebarshared.titleBar('กรอกข้อมูลส่วนตัว'),
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
                txtName(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                inputName(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                txtSurname(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                inputSurname(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                txtDt(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                inputDt(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                txtGender(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                btnGender(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                chkConfirm(),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                btnPfConfirm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(
          "ชื่อจริง",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget txtSurname() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: const Text(
          "นามสกุล",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget txtDt() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: const Text(
          "วัน/เดือน/ปี",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget inputName() {
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
        //hintText: '',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget inputSurname() {
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
        //hintText: '',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget inputDt() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: const SizedBox(
          width: 150,
          //height: 15,
          child: TextField(
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
              //hintText: '',
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ),
    );
  }

  Widget txtGender() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: const Text(
          "เพศ",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget btnGender() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
            ),
          ),
          child: const Padding(padding: EdgeInsets.all(10), child: Text('ชาย')),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
            textStyle: const TextStyle(
              fontSize: 15,
            ),
          ),
          child:
              const Padding(padding: EdgeInsets.all(10), child: Text('หญิง')),
        ),
      ],
    );
  }

  Widget btnPfConfirm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
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
          child:
              const Padding(padding: EdgeInsets.all(10), child: Text('ตกลง')),
        ),
      ],
    );
  }

  Widget chkConfirm() {
    return LinkedLabelCheckbox(
      label: 'ฉันยอมรับข้อตกลงผู้ใช้และนโยบายความเป็นส่วนตัว',
      padding: const EdgeInsets.symmetric(horizontal: 0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: RichText(
              text: TextSpan(
                text: label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint('Label has been tapped.');
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
