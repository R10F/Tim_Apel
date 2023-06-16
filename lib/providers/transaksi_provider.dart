import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';

class TransaksiProvider extends ChangeNotifier {
  final List<Transaksi> _listTransaksi = TransaksiData().listTransaksi;

  late int _currentNomorAntrean;
  int _selectedAntrean = -1;

  TransaksiProvider() {
    _currentNomorAntrean = _listTransaksi.length + 1;
  }

  List<Transaksi> get listTransaksi => _listTransaksi;

  get currentAntrean => _currentNomorAntrean;
  get selectedAntrean => _selectedAntrean;

  set selectedAntrean(value) {
    _selectedAntrean = value;
    notifyListeners();
  }

  void createNewOrder(int idKasir) {
    _listTransaksi.add(Transaksi(nomorAntrean: _currentNomorAntrean++, idKasir: idKasir));
    notifyListeners();
  }

  void addToCart(int idProduk, int qty) {
    _listTransaksi[selectedAntrean].addToCart(idProduk, qty);
    notifyListeners();
  }

  void deleteOrder(int index) {
    _listTransaksi.removeAt(index);
    notifyListeners();
  }
}
