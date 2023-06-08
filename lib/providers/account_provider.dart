import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tim_apel/models/account_data_model.dart';

class AccountProvider extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final accountData = AccountData();

  late List<Account> _userAccounts;
  late List<String> _profilePictures;

  AccountProvider() {
    _userAccounts = accountData.userAccounts;
    _profilePictures = accountData.profilePictures;

    _checkLoginStatus();
  }

  int _currentLoggedInUserIndex = -1;

  get isLoggedIn => _currentLoggedInUserIndex > -1;
  get userAccounts => _userAccounts;
  get currentUser => _userAccounts[_currentLoggedInUserIndex];
  get id => _currentLoggedInUserIndex;
  get isOwner => currentUser.isOwner;

  Map<String, String> register(data) {
    String username = data['username'].toString().trim();

    for (int i = 0; i < _userAccounts.length; i++) {
      if (_userAccounts[i].username == username) {
        return {'status': 'failed', 'message': 'Username sudah digunakan'};
      }
    }

    _userAccounts.add(Account(
        nama: data['nama'],
        username: username,
        password: data['password'],
        profilePicture: _profilePictures[Random().nextInt(_profilePictures.length)],
        jadwal: data['jadwal']));
    print(_userAccounts);
    notifyListeners();

    return {'status': 'success', 'message': 'Staf berhasil didaftarkan'};
  }

  get newName => currentUser['nama'];

  void changeNama(index, newName) {
    _userAccounts[index].nama = newName;
    notifyListeners();
  }

  Future<void> _checkLoginStatus() async {
    String? value = await _storage.read(key: 'MakmurApp_LoginID');
    print(value);
    print(_currentLoggedInUserIndex);
    if (value != null) {
      _currentLoggedInUserIndex = int.parse(value, radix: 10);
    }
    print(_currentLoggedInUserIndex);
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    bool verified = false;

    for (int i = 0; i < _userAccounts.length; i++) {
      var user = _userAccounts[i];

      if (user.username == username.trim() && user.password == password) {
        await _storage.write(key: 'MakmurApp_LoginID', value: i.toString());
        _currentLoggedInUserIndex = i;
        verified = true;
        break;
      }
    }
    notifyListeners();
    String? value = await _storage.read(key: 'MakmurApp_LoginID');
    print(value);
    return verified;
  }

  void removeAccount(int index) {
    _userAccounts.removeAt(index);
    notifyListeners();
  }

  logout() async {
    await _storage.delete(key: 'MakmurApp_LoginID');
    _currentLoggedInUserIndex = -1;
    notifyListeners();
  }

  // ======================
  // | PREFERENCE SECTION |
  // ======================

  final ThemeData _darkTheme = ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark);

  final ThemeData _lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        foregroundColor: Colors.black,
      ),
      primarySwatch: Colors.blue,
      brightness: Brightness.light);

  getSetting(String key) => currentUser.settings[key];

  void setSetting(String key, bool value) {
    currentUser.settings[key] = value;
    notifyListeners();
  }

  ThemeData getTheme() {
    if (!isLoggedIn) {
      return _lightTheme;
    } else {
      return getSetting('dark_mode') ? _darkTheme : _lightTheme;
    }
  }
}
