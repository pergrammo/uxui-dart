import 'package:flutter/material.dart';
import 'package:hvpoint/screen/profile_view.dart';
import '../shared/bgimage_shared.dart';
import '../shared/titlebar_shared.dart';
import '../screen/intro_view.dart';
import '../screen/success_view.dart';
import '../screen/nonetwork_view.dart';
import '../screen/expire_view.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var bgimageshared = BgImageShared();
  var titlebarshared = TitleBarShared();

  SampleItem? selectedMenu;

  int _selectedIndex = 0;

  String _titlePage(int item) {
    if (item == 0) {
      return 'แต้มรวมสะสม';
    } else if (item == 1) {
      return 'สแกน QR-Code';
    } else {
      return 'ประวัติการใช้แต้ม';
    }
  }

  String _bgPage(int item) {
    if (item == 0) {
      return 'images/04_bg/Home.png';
    } else if (item == 1) {
      return 'images/04_bg/QR.png';
    } else {
      return 'images/04_bg/History.png';
    }
  }

  Widget _buildPage(int item) {
    if (item == 0) {
      return homeTap();
    } else if (item == 1) {
      return qrTap();
    } else {
      return historyTap();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: bgimageshared.HmbgImage(_bgPage(_selectedIndex)),
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
                    builder: (context) => const ProfileView(),
                  ));
            },
          ),
          title: titlebarshared.titleBar(_titlePage(_selectedIndex)),
          foregroundColor: Colors.black,
          actions: <Widget>[
            Center(
              child: PopupMenuButton<SampleItem>(
                icon: const Icon(Icons.more_vert),
                //tooltip: 'คั้งค่า',
                tooltip: 'Page อื่นๆ',
                initialValue: selectedMenu,
                // Callback that sets the selected popup menu item.
                onSelected: (SampleItem item) {
                  switch (item) {
                    case SampleItem.itemOne:
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IntroView()),
                        );
                      }
                      break;
                    case SampleItem.itemTwo:
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NonetworkView()),
                        );
                      }
                      break;
                    case SampleItem.itemThree:
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExpireView()),
                        );
                      }
                      break;
                  }
                  setState(() {
                    selectedMenu = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SampleItem>>[
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemOne,
                    child: ListTile(
                      leading: Icon(Icons.multiple_stop),
                      title: Text('หน้า Intro'),
                    ),
                    //child: Text('หน้า Intro'),
                    //onTap: () => print("TAP"),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemTwo,
                    child: ListTile(
                      leading: Icon(Icons.wifi_off),
                      title: Text('No Internet!'),
                    ),
                    //child: Text('No Internet!'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemThree,
                    child: ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text('Expire!'),
                    ),
                    //child: Text('Expire!'),
                  ),
                ],
              ),
            ),
          ],
          /*
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              tooltip: 'คั้งค่า',
              onPressed: () {},
            ),
          ],
          */
        ),
        body: _buildPage(_selectedIndex),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: CreateBottombar(context),
        ),
      ),
    );
  }

  Container CreateBottombar(BuildContext context) {
    return Container(
      //add ClipRRect widget for Round Corner
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          //add background color
          backgroundColor: Colors.white,
          iconSize: 30,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: 'แต้มสะสม',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'สแกนคิวอาร์',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_history_outlined),
              label: 'การใช้แต้ม',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Padding homeTap() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/05_profile/pfimage.png',
            width: 120,
          ),
          //const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
          const Text(
            "ชื่อจริงสมมติ นามสกุลทดสอบ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          Container(
            //width: 100,
            //height: 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              //border: Border.all(
              //color: Colors.blue,
              //width: 4,
              //),
              //color: Colors.blue,
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFF3366FF),
                    Color(0xFF00CCFF),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              children: const <Widget>[
                Text(
                  "ยอดคงเหลือ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                Text(
                  "1,000 HVP",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          Image.asset(
            'images/05_profile/hvimage.png',
            //width: 120,
          ),
        ],
      ),
    );
  }

  Padding qrTap() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                //Navigator.pushNamed(context, 'SuccessView');
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const SuccessView(),
                    ));
              }, // Image tapped
              splashColor: Colors.white10, // Splash color over image
              child: Ink.image(
                fit: BoxFit.cover, // Fixes border issues
                width: 254,
                height: 254,
                image: const AssetImage(
                  'images/05_profile/qrscan.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView historyTap() {
    return ListView(
      children: <Widget>[
        //const Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 50,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 188, 188, 188),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "รับแต้ม",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                        Text(
                          "Healthverse Official",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 50,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 188, 188, 188),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      Text(
                        "+100",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                      Text(
                        "6/12/2022-11.23",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 50,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 188, 188, 188),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "จ่ายแต้ม",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                        Text(
                          "Healthverse Official",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 50,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 188, 188, 188),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      Text(
                        "-100",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                      Text(
                        "6/12/2022-10.53",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
