import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterfire/Sign/models/sign.dart';
import 'package:flutterfire/Sign/view_models/sign_view_model.dart';
import 'package:flutterfire/utils/app_sizes.dart';
import 'package:flutterfire/utils/shared_preferences.dart';
import 'package:flutterfire/widgets/custom_button.dart';
import 'package:flutterfire/widgets/popup_status.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SharedPreferencesHandler {
  Sign userData;
  bool isLoading = true;

  getData() async {
    var dataJson = await getSignData();
    Sign data = Sign.fromMap(json.decode(dataJson));

    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sign = Provider.of<SignViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(Sizes.s10),
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, ${userData.email}!',
                    style: TextStyle(
                      fontSize: FontSizes.s30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Sizes.s15),
                  CustomButton(
                    label: 'Sign-out',
                    onPressed: () {
                      sign.signOut().then((value) {
                        if (value == true) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'signIn', (route) => false);
                        } else {
                          PopupStatus.showFlushbar(
                            context,
                            false,
                            'Gagal Sign Out',
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
