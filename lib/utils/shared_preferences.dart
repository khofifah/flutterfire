import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  Future<bool> setSignData(String signData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('signData', signData);
  }

  Future<String> getSignData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('signData');
  }
}
