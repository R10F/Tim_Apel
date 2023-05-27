import 'package:flutter/material.dart';

class RegistStafProvider extends ChangeNotifier {
  bool _passwordVisible = false;
  TextEditingController namaController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController jadwalController = TextEditingController();

  bool isNameEmpty = false;
  bool isUsernameEmpty = false;
  bool isPasswordEmpty = false;
  bool isJadwalEmpty = false;

  final List _listStaf = [];
  var _staf = {};

  get staf => _staf;

  List get getListStaf => _listStaf.toList();

  set setListStaf(value) {
    _listStaf.add(value);
    print(_listStaf);
    notifyListeners();
  }

  set setStaf(value) {
    _staf = value;
    print(_staf);
    notifyListeners();
  }

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

  void removeStaf(int index) {
    _listStaf.removeAt(index);
    notifyListeners();
  }

  get getPasswordVisible => _passwordVisible;

  set setPasswordVisible(value) {
    _passwordVisible = value;
    notifyListeners();
  }
}
