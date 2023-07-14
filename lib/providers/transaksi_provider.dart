import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';
import 'package:tim_apel/utilities/datetime.dart';

class TransaksiProvider extends ChangeNotifier {
  final List<Transaksi> _listTransaksi = TransaksiData().listTransaksi;

  late int _currentNomorAntrean;
  int _selectedAntrean = -1; // -1 = tidak ada transaksi inProcess

  TransaksiProvider() {
    _currentNomorAntrean = _listTransaksi.length + 1;
    setFirstInProcessOrder();
  }

  get hasTransaksiActive => selectedAntrean > -1;
  get listTransaksi => _listTransaksi;
  get currentAntrean => _currentNomorAntrean;
  get selectedAntrean => _selectedAntrean;

  get listTransaksiSelesaiHariIni {
    List result = [];
    for (int i = 0; i < _listTransaksi.length; i++) {
      if (!_listTransaksi[i].inProcess && _listTransaksi[i].date == getTodayDate()) {
        result.add(_listTransaksi[i]);
      }
    }
    return result;
  }

  set selectedAntrean(value) {
    _selectedAntrean = value;
    notifyListeners();
  }

  void setFirstInProcessOrder() {
    int result = -1;
    for (int i = 0; i < _listTransaksi.length; i++) {
      if (_listTransaksi[i].inProcess) {
        result = i;
        break;
      }
    }
    _selectedAntrean = result;
  }

  void createNewOrder(int idKasir) {
    _listTransaksi.add(Transaksi(nomorAntrean: _currentNomorAntrean, idKasir: idKasir));
    _selectedAntrean = _currentNomorAntrean - 1;
    _currentNomorAntrean++;
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
    setFirstInProcessOrder();
    notifyListeners();
  }

  void transaksiSelesai(int idTransaksi, String metodePembayaran, List produkData) {
    var currentTransaksi = _listTransaksi[idTransaksi];

    currentTransaksi.metodePembayaran = metodePembayaran;
    currentTransaksi.inProcess = false;
    currentTransaksi.date = getTodayDate();
    currentTransaksi.time = getCurrentTime();

    currentTransaksi.listProduk.forEach((idProduk, qty) {
      if (!produkData[idProduk - 1].isDeleted) {
        currentTransaksi.listProdukAkhir.add([produkData[idProduk - 1], qty]);
        produkData[idProduk - 1].stok -= qty;
      }
    });

    setFirstInProcessOrder();
    notifyListeners();
  }
}
