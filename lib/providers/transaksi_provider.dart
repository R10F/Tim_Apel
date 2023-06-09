import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';

class TransaksiProvider extends ChangeNotifier {
  final List<Transaksi> _listTransaksi = TransaksiData().listTransaksi;

  late int _currentAntrean;

  TransaksiProvider() {
    _currentAntrean = _listTransaksi.length + 1;
  }

  List<Transaksi> get listTransaksi => _listTransaksi;

  get currentAntrean => _currentAntrean;

  void createNewOrder(int idKasir) {
    _listTransaksi.add(Transaksi(nomorAntrean: _currentAntrean++, idKasir: idKasir));
    notifyListeners();
  }

  void deleteOrder(int index) {
    _listTransaksi.removeAt(index);
    notifyListeners();
  }
}
