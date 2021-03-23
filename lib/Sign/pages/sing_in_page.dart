import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire/Sign/view_models/sign_view_model.dart';
import 'package:flutterfire/Sign/widgets/sign_text.dart';
import 'package:flutterfire/utils/app_sizes.dart';
import 'package:flutterfire/widgets/custom_button.dart';
import 'package:flutterfire/widgets/custom_input_text.dart';
import 'package:flutterfire/widgets/loading.dart';
import 'package:flutterfire/widgets/popup_status.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    final sign = Provider.of<SignViewModel>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(Sizes.s10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputText(
                controller: email,
                hintText: 'khof@khof.com',
                isEmail: true,
                label: 'Email',
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Email tidak boleh kosong';
                  } else if (EmailValidator.validate(value) == false) {
                    return 'Format Email salah';
                  }
                },
              ),
              SizedBox(height: Sizes.s15),
              CustomInputText(
                controller: password,
                hintText: '6 digit sandi anda',
                isPassword: true,
                label: 'Password',
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Password tidak boleh kosong';
                  } else if (value.length < 6) {
                    return 'Password tidak boleh kurang dari 6 karakter';
                  }
                },
              ),
              SizedBox(height: Sizes.s15),
              CustomButton(
                label: isSignUp == true ? 'Sign Up' : 'Sign In',
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    showLoading(context);

                    if (isSignUp == true) {
                      await sign
                          .signUp(email.text, password.text)
                          .then((value) {
                        hideLoading(context);

                        PopupStatus.showFlushbar(
                          context,
                          value.status,
                          value.message,
                        );

                        if (value.status == true) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'home', (route) => false);
                        }
                      });
                    } else {
                      await sign
                          .signIn(email.text, password.text)
                          .then((value) {
                        hideLoading(context);
                        PopupStatus.showFlushbar(
                          context,
                          value.status,
                          value.message,
                        );

                        if (value.status == true) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'home', (route) => false);
                        }
                      });
                    }
                  }
                },
              ),
              SizedBox(height: Sizes.s15),
              CustomButton(
                label: 'Sign In With Google',
                onPressed: () {
                  print('clicked');
                },
              ),
              SizedBox(height: Sizes.s15),
              isSignUp == true
                  ? SignText(
                      message: 'Sudah punya akun?',
                      method: 'Masuk akun',
                      onTap: () {
                        setState(() {
                          isSignUp = false;
                        });
                      },
                    )
                  : SignText(
                      message: 'Belum punya akun?',
                      method: 'Buat akun',
                      onTap: () {
                        setState(() {
                          isSignUp = true;
                        });
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
