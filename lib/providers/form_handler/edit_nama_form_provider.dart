import 'package:flutter/material.dart';

class EditNamaFormProvider extends ChangeNotifier {
  TextEditingController namaController = TextEditingController();

  bool _isEmpty = false;

  set nama(value) {
    namaController.text = value;
    notifyListeners();
  }

  set setisEmpty(value) {
    _isEmpty = value;
    notifyListeners();
  }

  get isEmpty => _isEmpty;

  get newName => namaController.text;
}
