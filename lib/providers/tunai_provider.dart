import 'package:flutter/material.dart';

import '../utilities/formatting.dart';

class TunaiProvider extends ChangeNotifier {
  int? _totalHarga;
  int _jumlahUang = 0;
  int _kembalian = -1;
  TextEditingController jumlahUangController = TextEditingController();
  TextEditingController kembalianController = TextEditingController();

  get getJumlahUang => _jumlahUang;

  get getKembalian => _kembalian;

  set setTotalHarga(value) {
    _totalHarga = value;
    notifyListeners();
  }

  set setKembalianHarga(value) {
    _kembalian = value;
    notifyListeners();
  }

  set setJumlahUang(value) {
    _jumlahUang = value;
    notifyListeners();
  }

  void setKembalian() {
    if (_jumlahUang < _totalHarga!) {
      _kembalian = -1;
    } else {
      _kembalian = _jumlahUang - _totalHarga!;
    }
    kembalianController.text = _kembalian == -1 ? '-' : currency(_kembalian);
  }
}
