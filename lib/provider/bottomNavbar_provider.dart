import 'package:flutter/material.dart';

class bottomNavbarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get getSelectedIdx => _selectedIndex;

  set setSelectedIdx(value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
