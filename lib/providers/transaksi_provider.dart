import 'package:flutter/material.dart';

class TransaksiModel {
  int? nomorAntrean;
  int idKasir;
  bool inProcess = true;
  String metodePembayaran = '';
  List listProduk = [];

  TransaksiModel({required this.nomorAntrean, required this.idKasir});

  get totalBelanja => 100;
}

class TransaksiProvider extends ChangeNotifier {
  int _currentAntrean = 1;

  final List<TransaksiModel> _listTransaksi = [];

  TransaksiProvider() {
    createNewOrder(0);
  }

  List<TransaksiModel> get listTransaksi => _listTransaksi;

  get currentAntrean => _currentAntrean;

  void createNewOrder(int idKasir) {
    _listTransaksi.add(TransaksiModel(nomorAntrean: _currentAntrean++, idKasir: idKasir));
    notifyListeners();
  }

  void deleteOrder(int index) {
    _listTransaksi.removeAt(index);
    notifyListeners();
  }
}
