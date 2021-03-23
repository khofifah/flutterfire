import 'package:flutter/material.dart';
import 'package:flutterfire/Home/pages/home_page.dart';
import 'package:flutterfire/Sign/pages/sing_in_page.dart';
import 'package:flutterfire/utils/splash_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => HomePage(),
        );

      case 'signIn':
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => SignInPage(),
        );

      case '/':
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => SplashScreen(),
        );
    }
  }
}
