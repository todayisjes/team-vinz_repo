import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPreferences {
  static Future<bool> saveUserLogInPreference(bool isUserLogIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool('login', isUserLogIn);
  }

  static Future<bool?> getUserLogInPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('login');
  }

  static Future<bool> saveUserNamePreference(String username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('username', username);
  }

  static Future<String?> getUserNamePreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('username');
  }
}