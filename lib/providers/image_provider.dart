import 'dart:async';
import 'dart:io';
import 'dart:js_util';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class ImgProvider extends ChangeNotifier {
  String? _imagePath;

  String? get imagePath => _imagePath;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _imagePath = pickedImage.path;
      notifyListeners();
    }
  }

  clearImage() {
    _imagePath = null;
    notifyListeners();
  }
}
