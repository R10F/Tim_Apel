import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends ChangeNotifier {
  SharedPreferences? _prefs;
  bool _isLogin = false;

  Future<void> loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _isLogin = _prefs?.getBool('login') ?? false;
    notifyListeners();
  }

  bool get isLogin => _isLogin;

  Future<void> setIsLogin(bool value) async {
    _isLogin = value;
    await _prefs?.setBool('login', value);
    notifyListeners();
  }

  Future<void> removeLogin() async {
    await _prefs?.remove('login');
    _isLogin = false;
    notifyListeners();
  }
}
