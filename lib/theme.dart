import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  static bool isDark = true;

  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
