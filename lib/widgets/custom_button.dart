import 'package:flutter/material.dart';
import 'package:flutterfire/utils/app_sizes.dart';

class CustomButton extends StatelessWidget {
  String label;
  Function onPressed;

  CustomButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Container(
          padding: EdgeInsets.all(Sizes.s15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/google.png'),
              SizedBox(width: Sizes.s10),
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
