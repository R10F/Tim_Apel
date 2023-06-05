import 'package:flutter/material.dart';

class TransaksiModel {
  int? nomorAntrean;
  bool inProcess = true;
  List listProduk = [];

  TransaksiModel({required this.nomorAntrean});

  get totalBelanja => 100;
}

class TransaksiProvider extends ChangeNotifier {
  final List<TransaksiModel> _listTransaksi = [TransaksiModel(nomorAntrean: 1)];

  List<TransaksiModel> get listTransaksi => _listTransaksi;

  // set setSelectedIdx(value) {
  //   _selectedIndex = value;
  //   notifyListeners();
  // }

  void createNewOrder() {
    int currentNumber = _listTransaksi.length + 1;
    _listTransaksi.add(TransaksiModel(nomorAntrean: currentNumber));
    notifyListeners();
  }
}
