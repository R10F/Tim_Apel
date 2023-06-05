import 'package:flutter/material.dart';

class RegisterStafFormProvider extends ChangeNotifier {
  bool _passwordVisible = false;
  TextEditingController namaController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController jadwalController = TextEditingController();

  bool isNameEmpty = false;
  bool isUsernameEmpty = false;
  bool isPasswordEmpty = false;
  bool isJadwalEmpty = false;

  set setIsNameEmpty(value) {
    isNameEmpty = value;
    notifyListeners();
  }

  set setIsUsernameEmpty(value) {
    isUsernameEmpty = value;
    notifyListeners();
  }

  set setIsPasswordEmpty(value) {
    isPasswordEmpty = value;
    notifyListeners();
  }

  set setIsJadwalEmpty(value) {
    isJadwalEmpty = value;
    notifyListeners();
  }

  get getPasswordVisible => _passwordVisible;

  set setPasswordVisible(value) {
    _passwordVisible = value;
    notifyListeners();
  }
}
