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

  Future<Map> login(String username, String password) async {
    bool verified = false;
    String message = '';

    for (int i = 0; i < _userAccounts.length; i++) {
      var user = _userAccounts[i];

      if (user.username == username.trim() && user.password == password) {
        if (!user.isActive) {
          message = 'Staf sudah dinonaktifkan';
          break;
        }
        await _storage.write(key: 'MakmurApp_LoginID', value: i.toString());
        _currentLoggedInUserIndex = i;
        verified = true;
        break;
      } else {
        message = 'Username atau password salah, silahkan coba lagi';
      }
    }
    notifyListeners();
    String? value = await _storage.read(key: 'MakmurApp_LoginID');
    return {'status': verified, 'message': message};
  }

  void activateAccount(int index) {
    _userAccounts[index].setIsActive(true);
    notifyListeners();
  }

  void deactivateAccount(int index) {
    _userAccounts[index].setIsActive(false);
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

  final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', fontSize: 26),
      displayMedium:
          TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Plus Jakarta Sans', fontSize: 23),
      displaySmall:
          TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Plus Jakarta Sans', fontSize: 20),
      bodyLarge: TextStyle(fontFamily: 'Figtree', fontSize: 16),
      bodyMedium: TextStyle(fontFamily: 'Figtree', fontSize: 14),
      bodySmall: TextStyle(fontFamily: 'Figtree', fontSize: 12),
      labelLarge: TextStyle(fontFamily: 'Figtree', fontSize: 10),
      labelMedium: TextStyle(fontFamily: 'Figtree', fontSize: 8),
    ),
  );

  final ThemeData _lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      foregroundColor: Colors.black,
    ),
    primarySwatch: Colors.teal,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', fontSize: 26),
      displayMedium:
          TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Plus Jakarta Sans', fontSize: 23),
      displaySmall:
          TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Plus Jakarta Sans', fontSize: 20),
      bodyLarge: TextStyle(fontFamily: 'Figtree', fontSize: 16),
      bodyMedium: TextStyle(fontFamily: 'Figtree', fontSize: 14),
      bodySmall: TextStyle(fontFamily: 'Figtree', fontSize: 12),
      labelLarge: TextStyle(fontFamily: 'Figtree', fontSize: 10),
      labelMedium: TextStyle(fontFamily: 'Figtree', fontSize: 8),
    ),
  );

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
