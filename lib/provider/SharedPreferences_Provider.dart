import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends ChangeNotifier {
  SharedPreferences? _prefs;

  loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  bool get isLogin => _prefs?.getBool('login') ?? false;

  setIsLogin(bool value) async {
    await _prefs?.setBool('login', value);
  }

  removeLogin() async {
    await _prefs?.remove('login');
    notifyListeners();
  }
}
