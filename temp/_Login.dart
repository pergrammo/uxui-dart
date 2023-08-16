import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/04_bg/Login.png"), fit: BoxFit.cover),
        //image: NetworkImage('https://point.healthverse.world/assets/images/04_bg/Login.png'),fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/00_hv_point_logo/Full/Group_826.png',
                    //Image.network('https://point.healthverse.world/assets/images/00_hv_point_logo/Full/Group_826.png',width: 120,
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 5)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      //color: Colors.red,
                      child: const Text(
                        "เบอร์โทรศัพท์มือถือ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                  const TextField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {},
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
