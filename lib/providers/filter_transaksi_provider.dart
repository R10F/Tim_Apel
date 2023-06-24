import 'package:flutter/material.dart';
import 'package:tim_apel/models/transaksi_data_model.dart';

class FilterTransaksiProvider extends ChangeNotifier {
  final List<String> _listMetodePembayaran = TransaksiData().listMetodePembayaran;
  final List<bool> _filterMetodePembayaran = [false, false, false, false, false];

  get listMetodePembayaran => _listMetodePembayaran;
  get filterMetodePembayaran => _filterMetodePembayaran;

  List<String> activeFilterMetodePembayaran() {
    List<String> result = [];
    for (int i = 0; i < _filterMetodePembayaran.length; i++) {
      if (_filterMetodePembayaran[i]) {
        result.add(_listMetodePembayaran[i]);
      }
    }
    return result;
  }

  void filterMetode(int index, bool status) {
    _filterMetodePembayaran[index] = status;
    notifyListeners();
  }
}
