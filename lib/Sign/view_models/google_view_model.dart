import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire/Sign/models/sign.dart';
import 'package:flutterfire/Sign/models/sign_status.dart';
import 'package:flutterfire/utils/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleViewModel extends ChangeNotifier with SharedPreferencesHandler {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<SignStatus> signInGoogle() async {
    var result;

    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      final sign = Sign(
        email: userCredential.user.email,
        nama: userCredential.user.displayName,
      );

      await setSignData(json.encode(sign.toMap(sign)));

      result = SignStatus(
        status: true,
        message: 'Sign-in sukses',
      );
    } catch (e) {
      result = SignStatus(
        status: false,
        message: 'Sign-in gagal',
      );
    }
    return result;
  }
}
