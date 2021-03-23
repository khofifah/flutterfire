import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class PopupStatus {
  static void showFlushbar(BuildContext context, bool status, String message) {
    IconData icon;
    Color color;

    if (status == true) {
      icon = Icons.check;
      color = Colors.greenAccent;
    } else {
      icon = Icons.warning;
      color = Colors.orangeAccent;
    }

    Flushbar(
      message: message,
      duration: Duration(seconds: 3),
      icon: Icon(
        icon,
        color: color,
      ),
    )..show(context);
  }
}
