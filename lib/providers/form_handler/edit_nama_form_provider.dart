import 'package:flutter/material.dart';

class EditNamaFormProvider extends ChangeNotifier {
  TextEditingController namaController = TextEditingController();

  bool _isEmpty = false;

  set nama(value) {
    namaController.text = value;
    notifyListeners();
  }

  set isEmpty(value) {
    _isEmpty = value;
    notifyListeners();
  }

  get isEmpty => _isEmpty;
}
