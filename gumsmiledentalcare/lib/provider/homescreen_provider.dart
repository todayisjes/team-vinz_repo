import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  var light = ThemeData(brightness: Brightness.light);
  var dark = ThemeData(brightness: Brightness.dark);
  bool _enableDarkMode = false;

  bool get enableDarkMode => _enableDarkMode;

  set setBrightness(val) {
    _enableDarkMode = val;
    notifyListeners();
  }
}
