import 'package:flutter/material.dart';

class DarkModeProvider extends ChangeNotifier {
  bool _darkModeswitchValue = false;

  bool get getdarkModeswitchvalue => _darkModeswitchValue;

  set setdarkModeswitchValue(val) {
    _darkModeswitchValue = val;
    notifyListeners();
  }

  final ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark);

  final ThemeData _lightTheme = ThemeData(
      appBarTheme:
          const AppBarTheme(color: Colors.white, foregroundColor: Colors.black),
      primarySwatch: Colors.blue,
      brightness: Brightness.light);

  ThemeData getTheme() {
    return getdarkModeswitchvalue ? _darkTheme : _lightTheme;
  }
}
