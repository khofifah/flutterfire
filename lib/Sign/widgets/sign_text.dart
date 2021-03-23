import 'package:flutter/material.dart';
import 'package:flutterfire/utils/app_sizes.dart';

class SignText extends StatelessWidget {
  String message, method;
  Function onTap;

  SignText({this.message, this.method, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(fontSize: FontSizes.s16),
        ),
        SizedBox(width: Sizes.s8),
        InkWell(
          child: Text(
            method,
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: FontSizes.s16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
