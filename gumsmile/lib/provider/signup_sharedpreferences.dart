import 'package:shared_preferences/shared_preferences.dart';

class SignupSharedPreferences {
  static Future<bool> saveUserSignUpPreference(bool isUserSignUp) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool('signup', isUserSignUp);
  }

  static Future<bool?> getUserSignUpPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('signup');
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