import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';

class TransaksiProvider extends ChangeNotifier {
  final List<Transaksi> _listTransaksi = TransaksiData().listTransaksi;

  late int _currentNomorAntrean;
  int _selectedAntrean = -1; // -1 = tidak ada transaksi inProcess

  TransaksiProvider() {
    _currentNomorAntrean = _listTransaksi.length + 1;
    _selectedAntrean = firstInProcessOrder();
  }

  get listTransaksi => _listTransaksi;
  get currentAntrean => _currentNomorAntrean;
  get selectedAntrean => _selectedAntrean;

  set selectedAntrean(value) {
    _selectedAntrean = value;
    notifyListeners();
  }

  int firstInProcessOrder() {
    int result = -1;
    for (int i = 0; i < _listTransaksi.length; i++) {
      if (_listTransaksi[i].inProcess) {
        result = i;
        break;
      }
    }
    return result;
  }

  void createNewOrder(int idKasir) {
    _listTransaksi.add(Transaksi(nomorAntrean: _currentNomorAntrean++, idKasir: idKasir));
    notifyListeners();
  }

  void addToCart(int idTransaksi, int idProduk, int qty) {
    _listTransaksi[idTransaksi].addToCart(idProduk, qty);
    notifyListeners();
  }

  void cancelCartItem(int idTransaksi, int idProduk) {
    _listTransaksi[idTransaksi].cancelCartItem(idProduk);
    notifyListeners();
  }

  void deleteOrder(int index) {
    _listTransaksi.removeAt(index);
    _selectedAntrean = firstInProcessOrder();
    notifyListeners();
  }
}
