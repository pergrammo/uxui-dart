import 'package:flutter/material.dart';

class BgImageShared {
  BgImageShared() {/**/}

  Decoration bgImage() {
    return const BoxDecoration(
      image: DecorationImage(
          //image: NetworkImage('https://point.healthverse.world/assets/images/04_bg/Login.png'), fit: BoxFit.cover),
          image: AssetImage('images/04_bg/Login.png'),
          fit: BoxFit.cover),
    );
  }

  Decoration CfbgImage() {
    return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/04_bg/Confirm_OTP.png'), fit: BoxFit.cover),
    );
  }

  Decoration HmbgImage(String url) {
    return BoxDecoration(
      image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
    );
  }

  Decoration ScbgImage() {
    return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/04_bg/Success.png'), fit: BoxFit.cover),
    );
  }

  Decoration NobgImage() {
    return const BoxDecoration(
      color: Colors.white,
    );
  }
}
