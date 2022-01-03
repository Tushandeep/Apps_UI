import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  Brightness _themeData = Brightness.light;

  Brightness getTheme() {
    return _themeData;
  }

  void setTheme(Brightness theme) {
    _themeData = theme;

    notifyListeners();
  }
}
