import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
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

  bool login(String username, String password) {
    bool verified = false;

    for (int i = 0; i < _userAccounts.length; i++) {
      var user = _userAccounts[i];

      if ((user['username'] == username) && (user['password'] == password)) {
        _currentLoggedInUserIndex = i;
        verified = true;
        break;
      }
    }
    return verified;
  }

  void removeAccount(int index) {
    _userAccounts.removeAt(index);
    notifyListeners();
  }

  logout() {
    _currentLoggedInUserIndex = -1;
  }
}
