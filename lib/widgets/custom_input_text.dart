import 'package:flutter/material.dart';
import 'package:flutterfire/utils/app_sizes.dart';

class CustomInputText extends StatelessWidget {
  String label, hintText;
  TextEditingController controller;
  Function validator;
  bool isEmail, isPassword;

  CustomInputText({
    this.label,
    this.controller,
    this.validator,
    this.hintText,
    this.isEmail = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: FontSizes.s16,
          ),
        ),
        SizedBox(height: Sizes.s10),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            keyboardType: isEmail == true ? TextInputType.emailAddress : null,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText == null ? '' : hintText,
              isDense: true,
              contentPadding: EdgeInsets.all(Sizes.s15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
