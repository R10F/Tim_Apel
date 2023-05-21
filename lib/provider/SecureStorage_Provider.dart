import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageProvider extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool _isLoggedIn = false;

  SecureStorageProvider() {
    _checkLoggedInStatus();
  }

  bool get isLoggedIn => _isLoggedIn;

  Future<void> _checkLoggedInStatus() async {
    String? loginValue = await _storage.read(key: 'login');
    _isLoggedIn = loginValue == 'true';
    notifyListeners();
  }

  Future<void> setLoggedInStatus(bool value) async {
    _isLoggedIn = value;
    await _storage.write(key: 'login', value: value.toString());
    notifyListeners();
  }

  Future<void> clearLoggedInStatus() async {
    _isLoggedIn = false;
    await _storage.deleteAll();
    notifyListeners();
  }
}
