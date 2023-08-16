import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                //'images/00_hv_point_logo/Full/Group_826.png',
                'https://point.healthverse.world/assets/images/00_hv_point_logo/Full/Group_826.png',
                width: 100,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const Text(
                'Lorem ipsum dolor sit amet',
                style: TextStyle(fontSize: 24),
              ),
              const Padding(padding: EdgeInsets.all(2)),
              const Text(
                'consectetur adipiscing elit',
                style: TextStyle(fontSize: 12),
              ),
              const Text(
                'fermentum magna et, ultrices magna',
                style: TextStyle(fontSize: 12),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.vpn_key),
                ),
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blue),
                      ),
                      child: const Text('Login'),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blueGrey),
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
