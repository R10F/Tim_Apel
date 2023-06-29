import 'package:flutter/material.dart';

class RegisterStafFormProvider extends ChangeNotifier {
  bool _passwordVisible = false;
  TextEditingController namaController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final List _day = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
  ];
  List<bool> checkboxValues = List<bool>.filled(7, false);
  List<TextEditingController> startTimeControllers =
      List<TextEditingController>.generate(7, (_) => TextEditingController());
  List<TextEditingController> endTimeControllers =
      List<TextEditingController>.generate(7, (_) => TextEditingController());

  bool isNameEmpty = false;
  bool isUsernameEmpty = false;
  bool isPasswordEmpty = false;

  // TextEditingController jadwalController = TextEditingController();

  // String _hari = "none";

  // get getHari => _hari;

  // bool isJadwalEmpty = false;

  get getListHari => _day.toList();

  set setIsNameEmpty(value) {
    isNameEmpty = value;
    notifyListeners();
  }

  set setIsUsernameEmpty(value) {
    isUsernameEmpty = value;
    notifyListeners();
  }

  set setIsPasswordEmpty(value) {
    isPasswordEmpty = value;
    notifyListeners();
  }

  // set setHari(value) {
  //   _hari = value;
  //   notifyListeners();
  // }

  // set setIsJadwalEmpty(value) {
  //   isJadwalEmpty = value;
  //   notifyListeners();
  // }

  bool getCheckboxValue(int index) {
    return checkboxValues[index];
  }

  setCheckboxValue(int index, value) {
    checkboxValues[index] = value;
    notifyListeners();
  }

  TextEditingController getStartTimeController(int index) {
    return startTimeControllers[index];
  }

  setStartTime(int index, value) {
    startTimeControllers[index].text = value;
    notifyListeners();
  }

  TextEditingController getEndTimeController(int index) {
    return endTimeControllers[index];
  }

  setEndTime(int index, value) {
    endTimeControllers[index].text = value;
    notifyListeners();
  }

  getJadwal() {
    String jadwal = "";
    for (var i = 0; i < _day.length; i++) {
      if (getCheckboxValue(i)) {
        String hari = _day[i];
        var startTime = getStartTimeController(i).text;
        var endTime = getEndTimeController(i).text;

        String jadwalTerpilih = '$hari\n$startTime - $endTime';
        jadwal += jadwal.isEmpty ? jadwalTerpilih : '\n\n$jadwalTerpilih';
      }
    }
    return jadwal;
  }

  setToDefault() {
    namaController.clear();
    usernameController.clear();
    passwordController.clear();

    for (var i = 0; i < _day.length; i++) {
      if (getCheckboxValue(i)) {
        setCheckboxValue(i, false);
        setStartTime(i, "");
        setEndTime(i, "");
      }
    }
  }

  get getPasswordVisible => _passwordVisible;

  set setPasswordVisible(value) {
    _passwordVisible = value;
    notifyListeners();
  }
}
