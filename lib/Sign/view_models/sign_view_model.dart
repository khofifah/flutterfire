import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire/Sign/models/sign.dart';
import 'package:flutterfire/Sign/models/sign_status.dart';
import 'package:flutterfire/utils/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignViewModel extends ChangeNotifier with SharedPreferencesHandler {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<SignStatus> signUp(String email, String password) async {
    var result;

    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User user = userCredential.user;

      final signUp = Sign(
        email: user.email.toString(),
        nama: user.displayName.toString(),
      );

      setSignData(json.encode(signUp.toMap(signUp)));

      result = SignStatus(
        status: true,
        message: 'Sign-up sukses',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        result = SignStatus(
          status: false,
          message: 'Password yang diberikan terlalu lemah',
        );
      } else if (e.code == 'email-already-in-use') {
        result = SignStatus(
          status: false,
          message: 'Terdapat akun dengan email yang diberikan',
        );
      }
    } catch (e) {
      result = SignStatus(
        status: false,
        message: 'Sign-up gagal',
      );
    }

    return result;
  }

  Future<SignStatus> signIn(String email, String password) async {
    var result;

    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User user = userCredential.user;

      final signIn = Sign(
        email: user.email.toString(),
        nama: user.displayName.toString(),
      );

      setSignData(json.encode(signIn.toMap(signIn)));

      result = SignStatus(
        status: true,
        message: 'Sign-in sukses',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        result = SignStatus(
          status: false,
          message: 'User tidak ditemukan untuk email tersebut',
        );
      } else if (e.code == 'wrong-password') {
        result = SignStatus(
          status: false,
          message: 'Password salah',
        );
      }
    } catch (e) {
      result = SignStatus(
        status: false,
        message: 'Sign-in gagal',
      );
    }

    return result;
  }

  Future<bool> signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      setSignData(null);
      return true;
    } catch (e) {
      return false;
    }
  }
}
