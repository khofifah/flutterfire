import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterfire/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SharedPreferencesHandler {
  getData() async {
    var signData = await getSignData();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
          context, signData == null ? 'signIn' : 'home'),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Image.asset('assets/images/KKM.png'),
    );
  }
}
