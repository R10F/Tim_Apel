import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  final List _userAccounts = [
    {
      'nama': 'Charles Makmur',
      'username': 'charles',
      'password': '1',
      'is_owner': true,
      'jadwal': 'jadwal charles',
      'settings': {'dark_mode': false, 'dashboard_minimal': false}
    },
    {
      'nama': 'Frederic Davidsen',
      'username': 'fred',
      'password': '1',
      'is_owner': false,
      'jadwal': 'jadwal fred',
      'settings': {'dark_mode': false, 'dashboard_minimal': true}
    }
  ];

  int _currentLoggedInUserIndex = -1;

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    String? value = await _storage.read(key: 'makmurApp_LoginID');
    print(value);
    print(_currentLoggedInUserIndex);
    if (value != null) {
      _currentLoggedInUserIndex = int.parse(value, radix: 10);
    }
    print(_currentLoggedInUserIndex);
    notifyListeners();
  }

  get isLoggedIn => _currentLoggedInUserIndex > -1;
  get userAccounts => _userAccounts;
  get currentUser => _userAccounts[_currentLoggedInUserIndex];
  get id => _currentLoggedInUserIndex;
  get isOwner => currentUser['is_owner'];

  set register(data) {
    _userAccounts.add({
      'nama': data['nama'],
      'username': data['username'],
      'password': data['password'],
      'is_owner': false,
      'jadwal': data['jadwal'],
      'settings': {'dark_mode': false, 'dashboard_minimal': false}
    });
    print(_userAccounts);
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    bool verified = false;

    for (int i = 0; i < _userAccounts.length; i++) {
      var user = _userAccounts[i];

      if ((user['username'] == username) && (user['password'] == password)) {
        await _storage.write(key: 'makmurApp_LoginID', value: i.toString());
        _currentLoggedInUserIndex = i;
        verified = true;
        break;
      }
    }
    String? value = await _storage.read(key: 'makmurApp_LoginID');
    print(value);
    return verified;
  }

  void removeAccount(int index) {
    _userAccounts.removeAt(index);
    notifyListeners();
  }

  logout() async {
    await _storage.delete(key: 'makmurApp_LoginID');
    _currentLoggedInUserIndex = -1;
    notifyListeners();
  }
}
