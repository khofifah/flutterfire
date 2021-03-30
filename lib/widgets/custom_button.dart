import 'package:flutter/material.dart';
import 'package:flutterfire/utils/app_sizes.dart';

class CustomButton extends StatelessWidget {
  String label;
  Function onPressed;
  bool isGoogle = false;

  CustomButton({this.label, this.onPressed, this.isGoogle});

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
              isGoogle == true
                  ? Image.asset(
                      'assets/icons/google.png',
                      height: Sizes.s15,
                      width: Sizes.s15,
                    )
                  : SizedBox(),
              SizedBox(width: isGoogle == true ? Sizes.s10 : 0),
              Text(
                label,
                style: TextStyle(
                  fontSize: FontSizes.s16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
