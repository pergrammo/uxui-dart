import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import '../screen/home_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<ContentConfig> listContentConfig = [];
  Color activeColor = Colors.blue;
  Color inactiveColor = Colors.grey;
  //Color inactiveColor = const Color(0xff03838b);
  double sizeIndicator = 7;

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "HV Point คืออะไร",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          //fontFamily: 'RobotoMono',
        ),
        description:
            "แอพสะสมแต้มสำหรับการใช้จ่ายหรือ เป็นส่วนลดสำหรับคนรักสุขภาพ",
        styleDescription: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        pathImage: "images/02_onboarding/onboarding_1.png",
        //backgroundColor: Color(0xfff5a623),
        backgroundImage: 'images/04_bg/Onboarding.png',
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "เพียงแค่สแกน",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          //fontFamily: 'RobotoMono',
        ),
        description:
            "และรับแต้มจากการทำกิจกรรม ก็พร้อมสำหรับการใช้แต้มเพื่อรับส่วนลด และสิทธิพิเศษมากมายที่กำลังจะมา",
        styleDescription: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        pathImage: "images/02_onboarding/onboarding_2.png",
        //backgroundColor: Color(0xff203152),
        backgroundImage: 'images/04_bg/Onboarding.png',
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "เหมาะกับใคร",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          //fontFamily: 'RobotoMono',
        ),
        description:
            "คนที่รักสุขภาพและอยากที่ประหยัดค่าใช้จ่าย ในการดูแลตัวเองและรับสิทธิประโยชน์ ด้านสุขภาพที่ไม่ซ้ำใคร",
        styleDescription: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        pathImage: "images/02_onboarding/onboarding_3.png",
        //backgroundColor: Color(0xff9932CC),
        backgroundImage: 'images/04_bg/Onboarding.png',
        backgroundImageFit: BoxFit.cover,
        backgroundFilterOpacity: 0,
      ),
    );
  }

  void onDonePress() {
    log("End of slides");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }

  Widget renderSkipBtn() {
    return const Text(
      'ข้าม',
      style: TextStyle(
        fontSize: 15,
        color: Colors.blue,
      ),
    );
  }

  Widget renderNextBtn() {
    return const Text(
      'ถัดไป',
      style: TextStyle(
        fontSize: 15,
        color: Colors.blue,
      ),
    );
  }

  Widget renderDoneBtn() {
    return const Text(
      'หน้าหลัก',
      style: TextStyle(
        fontSize: 15,
        color: Colors.blue,
      ),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(activeColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      doneButtonStyle: myButtonStyle(),
      onDonePress: onDonePress,

      // Indicator
      indicatorConfig: IndicatorConfig(
        sizeIndicator: sizeIndicator,
        indicatorWidget: Container(
          width: sizeIndicator,
          height: 7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: inactiveColor),
        ),
        activeIndicatorWidget: Container(
          width: sizeIndicator,
          height: 7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: activeColor),
        ),
        spaceBetweenIndicator: 7,
        typeIndicatorAnimation: TypeIndicatorAnimation.sliding,
      ),
    );
  }
}
