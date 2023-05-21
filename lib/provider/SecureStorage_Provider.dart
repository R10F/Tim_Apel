import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageProvider extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool _isLoggedIn = false;
  String? _userRole;

  SecureStorageProvider() {
    _checkLoggedInStatus();
  }

  bool get isLoggedIn => _isLoggedIn;
  String? get userRole => _userRole;

  Future<void> _checkLoggedInStatus() async {
    String? loginValue = await _storage.read(key: 'login');
    _isLoggedIn = loginValue == 'true';
    if (_isLoggedIn) {
      _userRole = await _storage.read(key: 'role');
    }
    notifyListeners();
  }

  Future<void> setLoggedInStatus(bool value, String? role) async {
    _isLoggedIn = value;
    if (_isLoggedIn) {
      _userRole = role;
      await _storage.write(key: 'role', value: role ?? '');
    } else {
      _userRole = null;
      await _storage.delete(key: 'role');
    }
    await _storage.write(key: 'login', value: value.toString());
    notifyListeners();
  }

  Future<void> clearLoggedInStatus() async {
    _isLoggedIn = false;
    await _storage.deleteAll();
    notifyListeners();
  }
}
