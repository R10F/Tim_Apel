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

  void setStatusFilterMetodePembayaran(int index, bool status) {
    _filterMetodePembayaran[index] = status;
    notifyListeners();
  }

  DateTime? _startDate;
  DateTime? _endDate;

  String _dateFilterType = 'date_range';
  final Map _dateFilterItem = {
    'date_range': {'name': 'Date Range', 'result': []},
    'multi_date': {'name': 'Multi Date', 'result': []},
  };

  get startDate => _startDate;
  get endDate => _endDate;
  get dateFilterType => _dateFilterType;
  get dateFilterItem => _dateFilterItem;

  void setStartEndDate(DateTime startDate, DateTime endDate) {
    _startDate = startDate;
    _endDate = endDate;
  }

  set dateFilterType(value) {
    _dateFilterType = value;
    notifyListeners();
  }

  void setDateFilterItemResult(String type, List result) {
    _dateFilterItem[type]['result'] = result;
    notifyListeners();
  }
}
