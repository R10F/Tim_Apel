import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _passwordVisible = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isUsernameEmpty = false;
  bool isPasswordEmpty = false;

  set setIsUsernameEmpty(value) {
    isUsernameEmpty = value;
    notifyListeners();
  }

  set setIsPasswordEmpty(value) {
    isPasswordEmpty = value;
    notifyListeners();
  }

  get getPasswordVisible => _passwordVisible;

  set setPasswordVisible(value) {
    _passwordVisible = value;
    notifyListeners();
  }
}
